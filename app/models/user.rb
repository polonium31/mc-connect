class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save :add_https_to_links
  has_many :posts, dependent: :destroy
  has_many :like_relationships, foreign_key: :liker_id, class_name: 'LikeUser', dependent: :destroy
  has_many :liked_users, through: :like_relationships, source: :liked_user

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def instagram_link?
    instagram_link.present?
  end

  def facebook_link?
    linkedin_link.present?
  end

  private

  def add_https_to_links
    link_attributes = [:instagram_link, :linkedin_link]

    link_attributes.each do |attribute|
      if self[attribute].present? && !self[attribute].start_with?('http://', 'https://')
        self[attribute] = "https://#{self[attribute]}"
      end
    end
  end
end
