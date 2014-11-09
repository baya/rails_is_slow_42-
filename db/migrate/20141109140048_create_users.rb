class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :account
      t.string :email
      t.string :phone
      t.string :zip
      t.string :address
      t.datetime :birthday
      t.integer :age
      t.string :company
      t.text :bio
      t.boolean :admin

      t.timestamps
    end
  end
end
