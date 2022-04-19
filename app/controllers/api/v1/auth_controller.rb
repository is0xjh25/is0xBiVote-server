class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create, :rescue]
  
	def create

		@user = User.where("lower(username) =?", user_login_params[:username].downcase).first
		
		if @user && @user.authenticate(user_login_params[:password])
			token = encode_token({ user_id: @user.id, due_time: Time.now + 86400 })
			render response.headers['Authorization'] = token, json: { message: "Log in successfully.", user: UserSerializer.new(@user) }, status: :accepted
		else
			render json: { message: "Invalid username or password." }, status: :unauthorized
		end
	end

	def rescue

		@user = User.where("lower(email) =?", user_rescue_params[:email].downcase).first
		return render json: { message: "Email not found." }, status: :not_found if !@user
		
		@token = generate_base64_token
		@user.update(password: @token)

		if @user.password_digest != nil
			PasswordMailer.password_rescue(@user, @token).deliver_now
			return render json: { message: "The new password has been sent it to user inbox." }, status: :accepted
		else
			return render json: { message: "Failed to reset password." }, status: :service_unavailable
		end
	end
  
	private
  
	def generate_base64_token
		return SecureRandom.urlsafe_base64
	end

	def user_login_params
		params.require(:user).permit(:username, :password)
	end

	def user_rescue_params
		params.require(:user).permit(:email)
	end
end