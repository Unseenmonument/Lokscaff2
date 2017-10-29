class AddListeningToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :listen_to, :text
  end
end
