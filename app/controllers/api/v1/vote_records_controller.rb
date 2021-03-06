class Api::V1::VoteRecordsController < ApplicationController
	
	# [GET]/[POST] user voting info on a certain vote
	def info

		vote = Vote.find_by_id(params[:id])
		return render json: { message: "Vote not found." }, status: :not_found if !vote
		
		vote_record = VoteRecord.find_by(vote: vote, user: current_user)

		if vote_record
			return render json: { message: "Vote record found.", vote_record: VoteRecordSerializer.new(vote_record) }, status: :ok
		else
			if vote.status == "progressing" 
				vote_record = VoteRecord.create(vote: vote, user: current_user, status: "start")
				return render json: {  message: "Vote record has been created.", vote_record: VoteRecordSerializer.new(vote_record) }, status: :created
			elsif vote.status == "closed"
				return render json: { message: "The vote is closed." }, status: :forbidden
			end
		end
	end

	# [PATCH] user vote
	def update

		vote = Vote.find(params[:id])
		return render json: { message: "Vote not found." }, status: :not_found if !vote

		vote_record = VoteRecord.find_by(vote: vote, user: current_user)
		
		if vote_record
			vote_record.update(vote_record_update_params)
			render json: { message: "Vote has been noted.", vote_record: VoteRecordSerializer.new(vote_record) }, status: :ok
		else
			render json: { message: "Vote record not found." }, status: :not_found
		end
	end

	private

	def vote_record_update_params
		params.require(:vote_record).permit(:vote_one, :vote_two, :status)
	end
end