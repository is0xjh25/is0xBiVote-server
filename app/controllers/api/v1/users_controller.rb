class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create, :test]

	def test
		return render json: {message: "Test successfully." }, status: :accepted
	end
	# [GET] user's profile
	def info
		return render json: {message: "Fetch user profile successfully.", user: UserSerializer.new(current_user) }, status: :accepted
	end

	# [POST] create new user
	def create

		user = User.create(user_create_params)
		
		if user.valid?
			token = encode_token({ user_id: user.id, due_time: Time.now + 86400 })
			render response.headers['Authorization'] = token, json: { message: "The new user has been created.", user: UserSerializer.new(user) }, status: :accepted
		else
			if find_username(user_create_params[:username]) 
				return render json: { message: "Username is registered." }, status: :conflict
			elsif find_email(user_create_params[:email])
				return render json: { message: "Email is registered." }, status: :conflict
			end
		end
	end

	# [PATCH] update new user
	def update		
		if find_email(user_update_params[:email]) && user_update_params[:email] != current_user.email
			return render json: { message: "Email is registered." }, status: :conflict
		else
			current_user.update(user_update_params)
			return render json: { message: "Profile has been updated.", user: UserSerializer.new(current_user) }, status: :ok
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
