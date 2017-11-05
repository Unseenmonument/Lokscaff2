class AddUpvotesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :upvotes, :text
    add_column :users, :downvotes, :text
  end
end
