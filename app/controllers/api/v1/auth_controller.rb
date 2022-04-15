class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create]
  
	def create

		@user = User.where("lower(username) =?", user_login_params[:username].downcase).first
		
		if @user && @user.authenticate(user_login_params[:password])
			token = encode_token({ user_id: @user.id, due_time: Time.now + 86400 })
			render response.headers['Authorization'] = token, json: { message: "Log in successfully.", user: UserSerializer.new(@user) }, status: :accepted
		else
			render json: { message: "Invalid username or password." }, status: :unauthorized
		end
	end
  
	private
  
	def user_login_params
		params.require(:user).permit(:username, :password)
	end
end