# Настройки приложения
class AppSetting < ActiveRecord::Base

  before_create :check_count

  # Настройка настроек
  def self.init_settings
    AppSetting.create if AppSetting.first.nil?
  end

  def name
    "Настройки"
  end

  private

  def check_count
    raise ActiveRecord::Rollback if AppSetting.all.size > 0
  end
end
