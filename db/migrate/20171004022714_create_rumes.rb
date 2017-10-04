class CreateRumes < ActiveRecord::Migration[5.1]
  def change
    create_table :rumes do |t|
      t.string :name
      t.text :description
      t.integer :listeners
      t.text :guidelines
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
