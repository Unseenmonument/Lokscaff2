class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :quantity
      t.string :name
      t.text :description
      t.float :price
      t.text :reviews
      t.integer :user_id
      t.integer :product_id
      t.integer :store_id

      t.timestamps
    end
  end
end
