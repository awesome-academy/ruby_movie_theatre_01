class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :room_id
      t.integer :ticket_id
      t.integer :film_id
      t.datetime :showtime

      t.timestamps
    end
  end
end
