class RemoveScheduleIdFromSeats < ActiveRecord::Migration[5.2]
  def change
    remove_column :seats, :schedule_id, :integer
  end
end
