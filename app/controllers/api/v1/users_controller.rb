class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create]

	# [GET] user's profile
	def info
		User.joins(:votes, :vote_records);
		render json: { response: UserSerializer.new(current_user) }, status: :accepted
	end

	# [GET] check username already exist
	def find_username
		if User.where("lower(username) =?", params[:username].downcase).first
			render json: { response: true }, status: :ok
		else
			render json: { response: false }, status: :ok
		end
	end

	# [GET] check email already exist
	def find_email
		if User.where("lower(email) =?", params[:email].downcase).first
			render json: { response: true }, status: :ok
		else
			render json: { response: false }, status: :ok
		end
	end

	# [POST] create new user
	def create
		@user = User.create(user_create_params)
		if @user.valid?
			@token = encode_token({ user_id: @user.id })
			render json: { response: UserSerializer.new(@user), jwt: @token }, status: :created
		else
			render json: { message: 'failed to create user' }, status: :unprocessable_entity
		end
	end

	# [PATCH] update new user
	def update
		if current_user.valid?
			if User.find_by_email(user_update_params[:email])
				render json: { message: 'email is registered' }, status: :conflict
			else
				current_user.update(user_update_params)
				render json: { response: UserSerializer.new(current_user) }, status: :ok
			end
		else
			render json: { message: 'failed to edit user' }, status: :unprocessable_entity
		end
	end

	private

	def user_create_params
		params.require(:user).permit(:username, :password, :email)
	end

	def user_update_params
		params.require(:user).permit(:password, :email)
	end
end
