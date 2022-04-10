class VoteRecord < ApplicationRecord
	belongs_to :user
    belongs_to :vote

	validates :vote_one, :inclusion => { :in => %w(yes no no_opnion not_interested) }
	validates :vote_two, :inclusion => { :in => %w(yes no no_opnion not_interested) }
	validates :status, inclusion: { :in => %w(start vote_one vote_two post) }
end
