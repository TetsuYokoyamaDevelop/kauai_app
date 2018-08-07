class CreateMicropostsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts_comments,id: false do |t|
      t.references :micropost, index: true, null: false
      t.references :comment, index: true, null: false
    end
  end
end
