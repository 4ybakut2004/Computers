class AddAboutToSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :about, :text, default: ""
  end
end
