class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :nickname
      t.integer :gender, default: 0
      t.date :birthday
      t.text :introduction

      t.timestamps
    end
  end
end
