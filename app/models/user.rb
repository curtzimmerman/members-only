class User < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	before_save { email.downcase! }
	
	validates :name, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
	validates :password, length: { minimum: 6 } 
	validates :member, inclusion: [true]
	has_secure_password

end
