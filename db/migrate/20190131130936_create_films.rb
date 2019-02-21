class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.integer :type_films, default: 0
      t.datetime :present
      t.integer :status, default: 0
      t.string :image
      t.string :trailer

      t.timestamps
    end
  end
end
