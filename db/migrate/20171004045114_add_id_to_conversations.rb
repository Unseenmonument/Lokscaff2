class AddIdToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :convo_id, :integer
  end
end
