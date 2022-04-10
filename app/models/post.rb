class Post < ApplicationRecord
	belongs_to :user
    belongs_to :vote
	
	validates :content, presence: true
end
