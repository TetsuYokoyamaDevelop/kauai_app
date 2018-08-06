class CreateMicropostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_comments do |t|
      t.references :micropost, index: true,foreign_key: true
      t.references :comment, index: true,foreign_key: true

      t.timestamps
    end
  end
end
