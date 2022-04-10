class Api::V1::UpvotesController < ApplicationController
	
	# [POST] new upvote
	def create
		post = Post.find(params[:id])
		if post
			@upvote = Upvote.find_or_create_by(user: current_user, post: post)
			render json: { response: UpvoteSerializer.new(@upvote) }, status: :created
		else
			render json: { message: "post not found" }, status: :not_found
		end
	end

	# [DELETE] undo upvote
	def destroy
		post = Post.find(params[:id])
		@upvote = Upvote.find_by(user: current_user, post: post)
		if @upvote
			@upvote.delete
			render json: { message: "upvote has been removed"}, status: :accepted
		else
			render json: { message: "record not found" }, status: :not_found
		end
	end
end


