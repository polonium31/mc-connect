class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :name, presence:true, length:{minimum: 2, maximum:30}
    
   
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, uniqueness:{case_sensitive: false }, format:{with: VALID_EMAIL_REGEX}

end