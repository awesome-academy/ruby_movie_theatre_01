class AddScheduleIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :schedule_id, :integer
  end
end
