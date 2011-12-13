class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text   :chat
      t.string :username
      t.timestamps
    end
  end
end
