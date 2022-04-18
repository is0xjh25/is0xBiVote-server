class Api::V1::VotesController < ApplicationController
	skip_before_action :authorized, only: [:entry, :info, :search_by_keyword, :search_by_date]

	# [GET] weekly votes
	def entry
		votes = find_votes;
		return render json: {message: "Fetch weekly votes successfully.", vote_entries: votes }, status: :ok
	end

	# [GET] a vote info
	def info
		vote = Vote.find_by_id(params[:id])
		return render json: { message: "Vote not found." }, status: :not_found if !vote
		
		if (current_user != nil) 
			user_id = current_user.id
		else 
			user_id = nil
		end
		return render json: {message: "Fetch the vote information successfully.", vote: VoteSerializer.new(vote),  post: PostCollectSerializer.new(vote, user_id: user_id) }, status: :ok	
	end

	# [GET] search history by date
	def search_by_date
		
		date = params[:date]
		upper_date = DateTime.parse(date).to_date.to_s
		lower_date = (DateTime.parse(date) - 90).to_date.to_s
		
		query =
			"SELECT id, name, start_time FROM votes
			WHERE start_time <= '#{upper_date}' and start_time >= '#{lower_date}'
			ORDER BY start_time DESC"

		res = ActiveRecord::Base.connection.execute(query)
		output = res

		return render json: {message: "Fetch the vote information successfully.", history: HistorySerializer.new(date: date, result: output) }, status: :ok	
	end

	# [GET] search history by keyword
	def search_by_keyword
		
		keyword = params[:keyword]

		query = 
			"SELECT id, name, start_time FROM votes
			WHERE name iLIKE '#{keyword}%' OR name iLIKE '%#{keyword}%' OR name iLIKE '%#{keyword}'
			OR category iLIKE '#{keyword}%' OR category iLIKE '%#{keyword}%' OR category iLIKE '%#{keyword}'"
		
		res = ActiveRecord::Base.connection.execute(query)
		output = res
			
		return render json: {message: "Fetch the vote information successfully.", history: HistorySerializer.new(keyword: keyword, result: output) }, status: :ok	
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