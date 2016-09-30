class AddRequestsEmailToSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :requests_email, :string, default: ""
  end
end
