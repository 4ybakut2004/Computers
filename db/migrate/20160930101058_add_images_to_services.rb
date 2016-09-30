class AddImagesToServices < ActiveRecord::Migration
  def up
    add_attachment :services, :big_image
  end

  def down
    remove_attachment :services, :big_image
  end
end
