class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change

    def change
      create_table :users do |t|
        t.string  :nickname
        t.timestamps
      end
    end

      create_table :microposts do |t|
        t.belongs_to :user, index: true
        t.text :text
        t.integer :tag
        t.integer :user_id

        t.timestamps
      end
  end
end
