class Post < ApplicationRecord
	belongs_to :user
    belongs_to :vote
	has_many :upvotes
	
	validates :content, presence: true
end
