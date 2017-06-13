# Для отправки SMS о заявках
class PhoneNumber < ActiveRecord::Base
  validates :phone, presence: true
end
