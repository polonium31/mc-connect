class User < ApplicationRecord
    has_secure_password
    has_many :comments, foreign_key: "created_by"
    has_many :likes, foreign_key: "liked_by"
    has_many :posts
end
