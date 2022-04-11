class Api::V1::PostsController < ApplicationController
	
	# [GET] post on a certain vote (yes, no, owned)
	def info
	end

	# [POST] new post
	def create
		
		vote = Vote.find_by_id(params[:id])
		return render json: { error: "vote not found" }, status: :not_found if !vote

		@post = Post.find_by(user: current_user, vote: vote)
		if @post
			render json: { post: PostSerializer.new(@post) }, status: :ok
		else
			@post = Post.create(user: current_user, vote: vote, content: post_create_params[:content])
			render json: { post: PostSerializer.new(@post) }, status: :created
		end
	end

	# [DELETE] user vote
	def destroy
		
		vote = Vote.find_by_id(params[:id])
		return render json: { error: "vote not found" }, status: :not_found if !vote
		
		@post = Post.find_by(user: current_user, vote: vote)
		if @post
			@post.delete
			render json: { post: "post has been removed" }, status: :accepted
		else
			render json: { error: "post not found" }, status: :not_found
		end
	end

	private

	def post_create_params
		params.require(:post).permit(:content)
	end
end

