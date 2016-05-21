class AddAddressToSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :address, :string
  end
end
