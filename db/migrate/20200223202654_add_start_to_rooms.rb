class AddStartToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :start, :string
  end
end
