class AddScheduleIdToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :schedule_id, :integer
  end
end
