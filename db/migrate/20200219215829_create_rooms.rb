class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :password_digest
      t.string :turn

      t.timestamps
    end
  end
end
