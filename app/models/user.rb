class User < ActiveRecord::Base
	has_many :posts

	attr_accessor :remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	before_save { self.email = email.downcase }
	
	validates :name, presence: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
	validates :password, length: { minimum: 6 }, allow_blank: true
	validates :member, inclusion: [true]
	has_secure_password


	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.generate_token
		SecureRandom::urlsafe_base64
	end

	def remember
		#generate token for remembering user
		#store digest in database, using update_attribute, since we don't have access to the user's password
		self.remember_token = User.generate_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		#user does not want to be remembered after this session
		update_attribute(:remember_digest, nil)
	end

end
