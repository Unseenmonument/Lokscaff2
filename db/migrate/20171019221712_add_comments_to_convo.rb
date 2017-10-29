class AddCommentsToConvo < ActiveRecord::Migration[5.1]
  def change
    add_column :convos, :comments, :integer
  end
end
