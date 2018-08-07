class CreateMicropostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_comments do |t|
      t.integer :micropost_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
