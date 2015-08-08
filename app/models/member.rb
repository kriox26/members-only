class Member < ActiveRecord::Base
  has_many :stories
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
					format:   { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
end