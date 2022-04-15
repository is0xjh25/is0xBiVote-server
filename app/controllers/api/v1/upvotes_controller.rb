class Api::V1::UpvotesController < ApplicationController
	
	# [POST] new upvote
	def create
		
		post = Post.find_by_id(params[:id])
		return render json: { message: "Post not found." }, status: :not_found if !post
		
		upvote = Upvote.find_or_create_by(user: current_user, post: post)
		return render json: { message: "Upvote successfully.", upvote: UpvoteSerializer.new(upvote) }, status: :created
	end

	# [DELETE] undo upvote
	def destroy
		
		post = Post.find_by_id(params[:id])
		return render json: { message: "Post not found." }, status: :not_found if !post
		
		upvote = Upvote.find_by(user: current_user, post: post)
		if upvote
			upvote.delete
			return render json: { message: "Undo upvote successfully.", upvote: "upvote has been removed"}, status: :accepted
		else
			return render json: { message: "Upvote not found." }, status: :not_found
		end
	end
end


