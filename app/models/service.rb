# Услуги
class Service < ActiveRecord::Base

  has_attached_file :big_image, styles: { medium: "300x300>", big: "557x557>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :big_image, content_type: /\Aimage\/.*\z/

  has_attached_file :small_image, styles: { thumb: "50x50>" }
  validates_attachment_content_type :small_image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true, uniqueness: true
  validates :key, presence: true, uniqueness: true

  scope :with_order, -> { order("services.order ASC") }

  default_scope { with_order }

  def key=(value)
    write_attribute(:key, (value || "").gsub(/[^\w]/, ""))
  end

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
    Service.create({ name: "Ремонт мониторов и телевизоров", key: "monitors_repair"})
  end
end
