class Api::V1::RequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  NULL_PHONE_ERROR = "Введите номер телефона"
  NULL_NAME_ERROR = "Введите имя"

  def create
    simple_json_response("Delivered") do
      raise UserException.new(NULL_PHONE_ERROR, phone: [NULL_PHONE_ERROR]) if params[:phone].nil? || params[:phone] == ""
      raise UserException.new(NULL_NAME_ERROR,  name:  [NULL_NAME_ERROR])  if params[:name].nil?  || params[:name]  == ""

      request = Request.create({ phone: params[:phone], name: params[:name] })

      # Отправка почты
      emails = Email.all
      if emails.size > 0
        RequestsMailer.new_request_message(
          emails.map { |e| e.email }.join(","),
          request.id,
          params[:name],
          params[:phone]
        ).deliver_later
      end

      # Отправка SMS
      phones = PhoneNumber.all
      if phones.size > 0
        text = "Заявка #{request.id}. Имя: #{params[:name]}. Телефон: #{params[:phone]}"
        result = get("https://sms.ru/sms/send", {
          api_id: ENV["SMS_API_KEY"],
          to: phones.map { |p| p.phone }.join(","),
          msg: text,
          json: "1"
        })

        result_status = result["status"]

        if result_status == "OK"
          sms_sent = false
          phone_results = []

          (result["sms"] || {}).each do |phone, info|
            phone_status = info["status"]

            if phone_status == "OK"
              sms_sent = true
              phone_results << { phone: phone, result: "Отправлено" }
            elsif phone_status == "ERROR"
              phone_results << { phone: phone, result: info["status_text"] }
            else
              phone_results << { phone: phone, result: "Неопознанная ошибка" }
            end
          end
          request.sms_sent = sms_sent
          request.sms_status = phone_results.map do |info|
            "#{info[:phone]}: #{info[:result]}"
          end.join(", ")
        elsif result_status == "ERROR"
          request.sms_sent = false
          request.sms_status = result["status_text"]
        else
          request.sms_sent = false
          request.sms_status = "Неопознанная ошибка"
        end

        request.save
      end

      { id: request.id }
    end
  end

  def get(path, params)
    uri = URI(path)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      JSON.parse(response.body)
    else
      { "status" => "ERROR", "status_text" => "Ошибка обращения к сервису SMS" }
    end
  end

end
