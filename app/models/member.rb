class Member < ActiveRecord::Base
  attr_accessor :remember_token
  has_many :stories
  before_save { self.email = email.downcase }
  before_validation :remember, on: :create
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
					format:   { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true

  # Returns the hash digest of the given string
  def Member.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
												  BCrypt::Engine.cost
	BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def Member.new_token
	SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions
  def remember
	self.remember_token = Member.new_token
	update_attribute(:remember_digest, Member.digest(remember_token))
  end

end
