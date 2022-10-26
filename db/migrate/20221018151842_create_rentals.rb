class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :occupant
      t.boolean :check_in
      t.boolean :check_out
      t.string :shift
      t.datetime :expected_checkout
      t.datetime :start_date
      t.references :room, null: false, foreign_key: true       

      t.timestamps
    end
  end
end
