class AddSmsApiKeyToSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :sms_api_key, :string
  end
end
