class RemoveStatusFromSeats < ActiveRecord::Migration[5.2]
  def change
    remove_column :seats, :status, :integer
  end
end
