class AddStatusToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :status, :integer
  end
end
