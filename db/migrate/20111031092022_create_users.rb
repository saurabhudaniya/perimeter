class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :address
      t.decimal :contact
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
