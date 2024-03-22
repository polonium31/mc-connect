class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, foreign_key: "created_by"
  has_many :post_likes, foreign_key: "liked_by"
end
