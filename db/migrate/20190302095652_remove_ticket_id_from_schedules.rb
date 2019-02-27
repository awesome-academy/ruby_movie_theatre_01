class RemoveTicketIdFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :ticket_id, :integer
  end
end
