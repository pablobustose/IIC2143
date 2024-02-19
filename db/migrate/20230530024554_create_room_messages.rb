class CreateRoomMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :room_messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
