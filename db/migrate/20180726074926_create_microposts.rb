class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.text :text
      t.integer :user_id
      t.integer :tag

      t.timestamps
    end
  end
end
