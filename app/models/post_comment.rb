class PostComment < ApplicationRecord
  belongs_to :post, foreign_key: "created_by"
end
