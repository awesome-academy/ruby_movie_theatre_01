class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :room_id
      t.integer :showtime_id
      t.integer :ticket_id
      t.integer :film_id

      t.timestamps
    end
    add_index :schedules, [:room_id, :showtime_id, :ticket_id, :film_id], unique: true
  end
end
