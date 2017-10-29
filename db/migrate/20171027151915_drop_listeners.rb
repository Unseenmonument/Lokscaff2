class DropListeners < ActiveRecord::Migration[5.1]
  def change
  	remove_column :rumes, :listeners, :integer
  end
end
