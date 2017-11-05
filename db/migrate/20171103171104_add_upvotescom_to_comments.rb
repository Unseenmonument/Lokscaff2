class AddUpvotescomToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :upvote_com, :text
    add_column :comments, :downvote_com, :text
  end
end
