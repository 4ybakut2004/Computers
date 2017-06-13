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
      RequestsMailer.new_request_message(
        Email.all.map { |e| e.email }.join(","),
        request.id,
        params[:name],
        params[:phone]
      ).deliver_later

      { id: request.id }
    end
  end

end
