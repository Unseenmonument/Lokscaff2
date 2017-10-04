class CreateTottles < ActiveRecord::Migration[5.1]
  def change
    create_table :tottles do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
