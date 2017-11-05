class AddListenersToRumesAgain < ActiveRecord::Migration[5.1]
  def change
    add_column :rumes, :listeners, :text
  end
end
