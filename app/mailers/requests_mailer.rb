class RequestsMailer < ActionMailer::Base
  default from: "#{ENV["GMAIL_USERNAME"]}@gmail.com"

  def new_request_message(email, id, name, phone)
    @title = "Заявка №#{id}"
    @name = name
    @phone = phone

    mail(to: email, subject: @title)
  end

end