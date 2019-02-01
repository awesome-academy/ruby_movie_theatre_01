class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.string :type
      t.datetime :present
      t.string :status
      t.string :image
      t.string :trailer

      t.timestamps
    end
  end
end
