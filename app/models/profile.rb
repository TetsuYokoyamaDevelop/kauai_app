class Profile < ApplicationRecord
  # belongs_to :user
  validates :nickname, presence:true
  validates :gender, presence:true
  validates :birthday, presence:true
  validates :introduction, length: { maximum: 140 }
end
