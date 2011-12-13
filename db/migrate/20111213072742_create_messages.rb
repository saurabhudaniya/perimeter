class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :reciever_id
      t.string :title
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
