class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create]
  
	def create
		@user = User.where("lower(username) =?", user_login_params[:username].downcase).first
		#User#authenticate comes from BCrypt
		if @user && @user.authenticate(user_login_params[:password])
			# encode token comes from ApplicationController
			token = encode_token({ user_id: @user.id })
			render json: { response: UserSerializer.new(@user), jwt: token }, status: :accepted
		else
			render json: { message: 'invalid username or password' }, status: :unauthorized
		end
	end
  
	private
  
	def user_login_params
		params.require(:user).permit(:username, :password)
	end
end