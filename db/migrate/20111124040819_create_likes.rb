class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.string :like

      t.timestamps
    end
  end
end
