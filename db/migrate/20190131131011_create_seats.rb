class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :position
      t.integer :room_id

      t.timestamps
    end
  end
end
