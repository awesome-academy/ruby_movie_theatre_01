class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_password
      t.string :user_email
      t.string :user_phone
      t.integer :user_wallet
      t.boolean :user_admin

      t.timestamps
    end
  end
end
