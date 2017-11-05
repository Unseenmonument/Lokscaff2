class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.text :products
      t.text :location
      t.integer :store_id
      t.integer :user_id
      t.string :email
      t.string :phone_number
      t.text :address

      t.timestamps
    end
  end
end
