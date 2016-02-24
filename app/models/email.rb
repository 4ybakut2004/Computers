# Адреса, на которые уходят уведомления о записи
class Email < ActiveRecord::Base

  validates :email, presence: true
end
