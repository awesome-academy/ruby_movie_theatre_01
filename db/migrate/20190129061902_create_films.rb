class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.string :film_type
      t.datetime :film_present
      t.string :file_status
      t.string :film_image
      t.string :film_trailer

      t.timestamps
    end
  end
end
