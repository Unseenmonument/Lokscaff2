class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :title
      t.text :description
      t.integer :likes
      t.string :url

      t.timestamps
    end
  end
end
