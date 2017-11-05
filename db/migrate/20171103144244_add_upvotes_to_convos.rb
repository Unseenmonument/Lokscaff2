class AddUpvotesToConvos < ActiveRecord::Migration[5.1]
  def change
    add_column :convos, :upvotes, :text
    add_column :convos, :downvotes, :text
  end
end
