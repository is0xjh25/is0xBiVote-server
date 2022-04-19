class PasswordMailer < ApplicationMailer
	def password_rescue(user, token)
		@user = user
		@token = token
		mail to: @user.email, subject: "BiVote Account Rescue"
	end
end
