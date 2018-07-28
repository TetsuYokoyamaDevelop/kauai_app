class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.integer :gender
      t.date :birthday
      t.text :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
