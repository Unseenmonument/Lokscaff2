class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :listeners
      t.text :guidelines

      t.timestamps
    end
  end
end
