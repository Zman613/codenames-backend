class CreateSpyMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :spy_messages do |t|
      t.string :message
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
