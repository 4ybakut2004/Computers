# Услуги
class Service < ActiveRecord::Base

  validates :name, presence: true
  validates :key, presence: true, uniqueness: true

  # Первоначальная инициализация
  def self.init_services
    Service.all.destroy_all

    Service.create({ name: "Установка Windows", price: "400", crossed_price: "500", key: "windows", order: 1 })
    Service.create({ name: "Ремонт компьютеров", price: "450", crossed_price: "550", key: "repair", order: 2 })
    Service.create({ name: "Ремонт ноутбуков", price: "450", crossed_price: "550", key: "note_repair", order: 3 })
    Service.create({ name: "Настройка интернета", price: "350", crossed_price: "350", key: "internet", order:4 })
    Service.create({ name: "Wi-Fi", price: "400", crossed_price: "500", key: "wifi", order: 5 })
    Service.create({ name: "Удаление вредоносных программ", price: "300", crossed_price: "400", key: "bad_programs", order: 6 })
    Service.create({ name: "Установка антивируса", price: "400", crossed_price: "500", key: "antivirus", order: 7 })
  end
end
