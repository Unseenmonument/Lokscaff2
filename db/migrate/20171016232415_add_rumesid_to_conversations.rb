class AddRumesidToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :rume_id, :integer
  end
end
