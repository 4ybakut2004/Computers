class AddSmallImageToServices < ActiveRecord::Migration
  def up
    add_attachment :services, :small_image
  end

  def down
    remove_attachment :services, :small_image
  end
end
