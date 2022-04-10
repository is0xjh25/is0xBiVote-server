class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create]

	def profile
		render json: { user: UserSerializer.new(current_user) }, status: :accepted
	end

	def find_username
		if User.where("lower(username) =?", params[:username].downcase).first
			render json: { exist: true }, status: :ok
		else
			render json: { exist: false }, status: :ok
		end
	end

	def find_email
		puts("XXXXXXXXXXXXXX")
		puts(params[:email])
		puts("XXXXXXXXXXXXXX")
		if User.where("lower(email) =?", params[:email].downcase).first
			render json: { exist: true }, status: :ok
		else
			render json: { exist: false }, status: :ok
		end
	end

	def create
		@user = User.create(user_params)
		if @user.valid?
			@token = encode_token({ user_id: @user.id })
			render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
		else
			render json: { error: 'failed to create user' }, status: :unprocessable_entity
		end
	end

	def update
		if current_user.valid?
			if User.find_by_email(user_params_1[:email])
				render json: { error: 'failed to edit user' }, status: :conflict
			else
				current_user.update(user_params_1)
				render json: { user: UserSerializer.new(current_user) }, status: :ok
			end
		else
			render json: { error: 'failed to edit user' }, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password_digest, :email)
	end

	def user_params_1
		params.require(:user).permit(:password_digest, :email)
	end
end
