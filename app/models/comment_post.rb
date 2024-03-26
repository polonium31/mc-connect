class CommentPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
