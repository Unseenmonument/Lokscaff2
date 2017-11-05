class AddUpvotesToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :upvotes, :text
    add_column :comments, :downvotes, :text
  end
end
