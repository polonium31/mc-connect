class Post < ApplicationRecord
  belongs_to :user
  has_many :comment_posts, dependent: :destroy
end
