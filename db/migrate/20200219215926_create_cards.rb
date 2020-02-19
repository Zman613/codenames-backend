class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :word
      t.string :team
      t.boolean :clicked
      t.integer :room_id

      t.timestamps
    end
  end
end
