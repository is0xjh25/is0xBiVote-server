class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create]
  
	def create
		@user = User.find_by(username: user_login_params[:username])
		@user.password = user_login_params[:password_digest]
		@user.password_confirmation = user_login_params[:password_digest]
		@user.save
		@user = User.find_by(username: user_login_params[:username])
		#User#authenticate comes from BCrypt
		if @user && @user.authenticate(user_login_params[:password_digest])
			# encode token comes from ApplicationController
			token = encode_token({ user_id: @user.id })
			render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
		else
			render json: { message: 'invalid username or password' }, status: :unauthorized
		end
	end
  
	private
  
	def user_login_params
		params.require(:user).permit(:username, :password_digest)
	end
end