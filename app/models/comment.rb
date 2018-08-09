class Comment < ApplicationRecord
  belongs_to :user
  has_many :micropost_comments
  has_many :microposts,  dependent: :destroy,:through => :micropost_comments
end
