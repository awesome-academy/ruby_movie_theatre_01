class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.datetime :ticket_soldtime
      t.string :ticket_price
      t.string :ticket_status
      t.integer :seat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
