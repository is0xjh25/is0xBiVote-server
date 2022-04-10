class Api::V1::PostsController < ApplicationController
	
	# [GET] post on a certain vote (yes, no, owned)
	def info
	end

	# [POST] new post
	def create
		vote = Vote.find(params[:id])
		if vote
			@post = Post.find_by(user: current_user, vote: vote)
			if @post
				render json: { response: PostSerializer.new(@post) }, status: :ok
			else
				@post = Post.create(user: current_user, vote: vote, content: post_create_params[:content])
				render json: { response: PostSerializer.new(@post) }, status: :created
			end
		else
			render json: { message: "vote not found" }, status: :not_found
		end
	end

	# [DELETE] user vote
	def destroy
		vote = Vote.find(params[:id])
		@post = Post.find_by(user: current_user, vote: vote)
		if @post
			@post.delete
			render json: { message: "post has been remove" }, status: :accepted
		else
			render json: { message: "record not found" }, status: :not_found
		end
	end

	private

	def post_create_params
		params.require(:post).permit(:content)
	end
end

