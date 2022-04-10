class User < ApplicationRecord
	has_secure_password

	# validation
	VALID_USERNAME_REGEX = /^[A-Za-z\d,-]{1,12}$/
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
	validates :username, presence: true, uniqueness: { case_sensitive: false } format: { with: VALID_NAME_REGEX, message: "should not contain numbers or symbols" }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX, message: "invalid"}
end
