class CreateConvos < ActiveRecord::Migration[5.1]
  def change
    create_table :convos do |t|
      t.integer :user_id
      t.integer :rume_id
      t.string :title
      t.text :description
      t.integer :likes
      t.string :url
      t.integer :convo_id

      t.timestamps
    end
  end
end
