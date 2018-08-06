class Micropost < ApplicationRecord
  belongs_to :user, optional: true
  has_many :micropost_comments
  has_many :comments, through: :micropost_comments
  accepts_nested_attributes_for :micropost_comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }
end
