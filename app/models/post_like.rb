class PostLike < ApplicationRecord
  belongs_to :post, foreign_key: "liked_by"
end
