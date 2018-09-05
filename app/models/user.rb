class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :microposts
   # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   #  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :email, presence: true
    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
    validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
    validates :nickname, presence:true, on: :update
    validates :gender, presence:true, on: :update
    enum gender: { 男性: 1, 女性: 2, その他: 3}
    validates :birthday, presence:true, on: :update
    validates :introduction, length: { maximum: 140 }
    mount_uploader :image, ImageUploader
end
