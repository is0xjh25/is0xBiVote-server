class Api::V1::UpvotesController < ApplicationController
	
	# [POST] new upvote
	def create
		
		post = Post.find_by_id(params[:id])
		return render json: { error: "post not found" }, status: :not_found if !post
		
		upvote = Upvote.find_or_create_by(user: current_user, post: post)
		return render json: { upvote: UpvoteSerializer.new(upvote) }, status: :created
	end

	# [DELETE] undo upvote
	def destroy
		
		post = Post.find_by_id(params[:id])
		return render json: { error: "post not found" }, status: :not_found if !post
		
		upvote = Upvote.find_by(user: current_user, post: post)
		if upvote
			upvote.delete
			return render json: { upvote: "upvote has been removed"}, status: :accepted
		else
			return render json: { error: "upvote not found" }, status: :not_found
		end
	end
end


