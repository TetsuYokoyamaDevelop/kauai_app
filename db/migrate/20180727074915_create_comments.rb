class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.replyment :text
      t.integer :user_id

      t.timestamps
    end
  end
end
