class RemoveListenersFromRumes < ActiveRecord::Migration[5.1]
  def change
    remove_column :rumes, :listeners
  end
end
