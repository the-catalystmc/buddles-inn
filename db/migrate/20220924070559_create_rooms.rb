class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.float :price
      t.boolean :available
      t.string :amenities
      t.string :image
      
      t.timestamps
    end
  end
end
