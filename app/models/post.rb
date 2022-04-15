class Post < ApplicationRecord
	belongs_to :user
    belongs_to :vote
	has_many :upvotes, dependent: :destroy
	
	validates :content, presence: true
end
