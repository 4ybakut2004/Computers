class AddShowInHeaderToServices < ActiveRecord::Migration
  def change
    add_column :services, :show_in_header, :boolean, default: false
  end
end
