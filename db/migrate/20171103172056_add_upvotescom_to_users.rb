class AddUpvotescomToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :upvote_com, :text
    add_column :users, :downvote_com, :text
  end
end
