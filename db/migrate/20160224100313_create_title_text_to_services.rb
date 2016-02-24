class CreateTitleTextToServices < ActiveRecord::Migration
  def change
    add_column :services, :title_text, :text, default: ""
  end
end
