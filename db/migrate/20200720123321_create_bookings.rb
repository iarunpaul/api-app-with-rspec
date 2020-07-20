class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :booking_reference
      t.boolean :payment_status
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
