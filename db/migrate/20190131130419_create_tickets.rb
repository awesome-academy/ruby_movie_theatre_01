class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.datetime :soldtime
      t.string :price
      t.string :status
      t.integer :seat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
