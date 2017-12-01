class AddStoresAndProductsToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :store_id, :integer
    add_column :comments, :product_id, :integer
    add_column :comments, :picture_id, :integer
    add_column :comments, :tottle_id, :integer
  end
end
