class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :equipment_id
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
