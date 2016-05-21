# Услуги
class Service < ActiveRecord::Base

  validates :name, presence: true
  validates :key, presence: true, uniqueness: true

  # Первоначальная инициализация
  def self.init_services
    Service.all.destroy_all

    Service.create({ name: "Установка Windows", key: "windows"})
    Service.create({ name: "Ремонт компьютеров", key: "repair"})
    Service.create({ name: "Ремонт ноутбуков", key: "note_repair"})
    Service.create({ name: "Ремонт моноблоков", key: "monoblock_repair"})
    Service.create({ name: "Настройка Wi-Fi", key: "wifi"})
    Service.create({ name: "Подключение к интернету", key: "internet"})
    Service.create({ name: "Восстановление данных", key: "data_repair"})
    Service.create({ name: "Разработка сайтов", key: "sites"})
    Service.create({ name: "Заправка картриджей", key: "cartridges"})
  end
end
