class Vote < ApplicationRecord
	# include ActiveModel::Validations
	has_many :vote_records
	has_many :user, through: :vote_records
	has_many :posts

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :category, :inclusion => { :in => ["world", "mystery", "sport", "entertainment"] }
	validates :end_time, presence: true
	validates :status, :inclusion => { :in => ["progressing", "closed"] }
end