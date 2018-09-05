class CreateMicropostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_comments do |t|
      t.references :micropost, foreign_key: true, null: false
      t.references :comment, foreign_key: true, null: false

      t.timestamps
    end
  end
end
