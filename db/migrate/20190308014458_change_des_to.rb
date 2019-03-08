class ChangeDesTo < ActiveRecord::Migration[5.2]
  def change
    change_column :films, :description, :text
  end
end
