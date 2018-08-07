class MicropostComment < ApplicationRecord
  belongs_to :micropost
  belongs_to :comment
end
