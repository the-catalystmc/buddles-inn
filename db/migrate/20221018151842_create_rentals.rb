class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.boolean :check_in
      t.boolean :check_out
      t.string :shift
      t.integer :number_of_days
      t.integer :number_of_hours
      t.datetime :start_date
      t.datetime :end_date         

      t.timestamps
    end
  end
end
