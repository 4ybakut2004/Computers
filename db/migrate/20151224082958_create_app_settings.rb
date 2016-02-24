class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.string :phone, default: ""
      t.string :company_name, default: ""

      t.timestamps null: false
    end

    AppSetting.init_settings
  end
end
