class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.integer :rume_id
      t.integer :convo_id
      t.integer :comment_id
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
