class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create]

	# [GET] user's profile
	def info
		return render json: { user: UserSerializer.new(current_user) }, status: :accepted
	end

	# [POST] create new user
	def create

		user = User.create(user_create_params)
		
		if user.valid?
			token = encode_token({ user_id: user.id })
			return render json: { user: UserSerializer.new(user), jwt: token }, status: :created
		else
			if find_username(user_create_params[:username]) 
				return render json: { error: 'username is registered' }, status: :conflict
			elsif find_email(user_create_params[:email])
				return render json: { error: 'email is registered' }, status: :conflict
			end
		end
	end

	# [PATCH] update new user
	def update		
		if find_email(user_create_params[:email])
			return render json: { error: 'email is registered' }, status: :conflict
		else
			current_user.update(user_update_params)
			return render json: { user: UserSerializer.new(current_user) }, status: :ok
		end
	end

	private

	def user_create_params
		params.require(:user).permit(:username, :password, :email)
	end

	def user_update_params
		params.require(:user).permit(:password, :email)
	end

	# check username already exist
	def find_username(u)
		return User.where("lower(username) =?", u.downcase).first
	end

	# check email already exist
	def find_email(e)
		return User.where("lower(email) =?", e.downcase).first
	end
end