class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false, default: ""
      t.string :price, default: ""
      t.string :crossed_price, default: ""
      t.string :key, null: false

      t.timestamps null: false
    end

    add_index :services, :key, unique: true
  end
end
