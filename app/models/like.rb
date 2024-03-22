class Like < ApplicationRecord
  belongs_to :user, foreign_key: "liked_by"
end
