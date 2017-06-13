class AddSmsSentToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :sms_sent, :boolean
    add_column :requests, :sms_status, :text
  end
end
