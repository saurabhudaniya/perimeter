class CommentExtension < ActiveRecord::Migration
  def up
    add_column :comments , :user_id , :integer
    add_column :comments , :reply_id, :integer
  end

  def down
    remove_column :comments , :user_id
    remove_column :comments , :reply_id
  end
end
