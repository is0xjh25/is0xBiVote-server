class User < ApplicationRecord
	has_many :vote_records
	has_many :votes, through: :vote_records
	has_many :upvotes
	has_many :posts
	has_secure_password

	# validation
	VALID_USERNAME_REGEX = /\A[A-Za-z\d,-]{1,12}\z/
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
	validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_USERNAME_REGEX }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end
