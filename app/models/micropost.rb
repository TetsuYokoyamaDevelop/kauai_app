class Micropost < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }
end
