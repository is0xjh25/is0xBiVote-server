class Api::V1::VotesController < ApplicationController
	skip_before_action :authorized, only: [:entry, :info]

	# [GET] weekly votes
	def entry
		votes = find_votes;
		return render json: {message: "fetch weekly votes successfully", vote_entries: votes }, status: :ok
	end

	# [GET] a vote info
	def info
		vote = Vote.find_by_id(params[:id])
		return render json: { message: "vote not found" }, status: :not_found if !vote
		
		if (current_user != nil) 
			user_id = current_user.id
		else 
			user_id = nil
		end
		return render json: {message: "fetch the vote information successfully", vote: VoteSerializer.new(vote),  post: PostCollectSerializer.new(vote, user_id: user_id) }, status: :ok	
	end

	private
	
	def find_votes
		world_id = Vote.where(category: 'world', status: 'progressing')[0]['id']
		mystery_id = Vote.where(category: 'mystery', status: 'progressing')[0]['id']
		sport_id = Vote.where(category: 'sport', status: 'progressing')[0]['id']
		entertainment_id = Vote.where(category: 'entertainment', status: 'progressing')[0]['id']
		return { world: world_id, mystery: mystery_id, sport: sport_id, entertainment: entertainment_id}
	end
end



