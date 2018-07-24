class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :patron_id
      t.integer :pilot_id
      t.text :summary
      t.datetime :when

      t.timestamps
    end
  end
end
