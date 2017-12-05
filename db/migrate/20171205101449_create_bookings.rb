class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.integer :total_price
      t.date :initial_date
      t.integer :number_nights

      t.timestamps
    end
  end
end
