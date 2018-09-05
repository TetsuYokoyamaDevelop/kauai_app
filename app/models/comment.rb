class Comment < ApplicationRecord
  belongs_to :user
  has_many :micropost_comments
  has_many :microposts,  dependent: :destroy, through: :micropost_comments
  validates :replyment, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
end
