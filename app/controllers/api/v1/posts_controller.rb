class Api::V1::PostsController < ApplicationController
	
	# [POST] new post
	def create
		
		vote = Vote.find_by_id(params[:id])
		return render json: { message: "Vote not found." }, status: :not_found if !vote

		vote_record = VoteRecord.find_by(user_id: current_user.id, vote_id: vote.id)
		return render json: { message: "Vote record not found." }, status: :not_found if !vote_record
		return render json: { message: "The vote is neither yes nor no, it cannot be commented." }, status: :not_acceptable if vote_record.vote_two == 'no_opinion' || vote_record.vote_two == 'not_interested'

		post = Post.find_by(user: current_user, vote: vote)
		if post
			render json: { message: "Posted already.", post: PostSerializer.new(post) }, status: :ok
		else
			post = Post.create(user: current_user, vote: vote, content: post_create_params[:content], vote_two: vote_record.vote_two)
			render json: { message: "Content has been posted.", post: PostSerializer.new(post) }, status: :created
		end
	end

	# [DELETE] user vote
	def destroy
		
		@vote = Vote.find_by_id(params[:id])
		return render json: { message: "Vote not found." }, status: :not_found if !@vote
		
		@post = Post.find_by(user: current_user, vote: @vote)
		if @post
			@post.destroy
			render json: { message: "Post has been removed." }, status: :accepted
		else
			render json: { message: "Post not found." }, status: :not_found
		end
	end

	private

	def post_create_params
		params.require(:post).permit(:content)
	end
end