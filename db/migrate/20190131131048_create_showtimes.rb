class CreateShowtimes < ActiveRecord::Migration[5.2]
  def change
    create_table :showtimes do |t|
      t.datetime :time

      t.timestamps
    end
  end
end
