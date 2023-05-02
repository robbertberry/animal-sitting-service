class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :animal_name, null: false, default: ''
      t.integer :animal_type, null: false, default: 0
      t.integer :hours_requested, null: false, default: 2
      t.references :user, index: true
      t.datetime :date_of_service, null: false

      t.timestamps
    end
  end
end
