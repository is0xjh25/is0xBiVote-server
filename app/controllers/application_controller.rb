class ApplicationController < ActionController::API
	before_action :authorized

	def encode_token(payload)
		# should store secret in env variable
		JWT.encode(payload, 'my_s3cr3t')
	end

	def auth_header
		# { Authorization: 'Bearer ' }
		request.headers['Authorization']
	end

	def decoded_token
		if auth_header
			token = auth_header.split(' ')[1]
			# header: { 'Authorization': 'Bearer ' }
			begin
				JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
			rescue JWT::DecodeError
				nil
			end
		end
	end

	def current_user
		if decoded_token
			user_id = decoded_token[0]['user_id']
			due_time = decoded_token[0]['due_time']
			puts(due_time > Time.now)
			if due_time > Time.now
				@user = User.find_by(id: user_id)
			else
				@user = nil
			end
		end
	end

	def logged_in?
		!!current_user
	end

	def authorized
		render json: { message: "User is not authorized." }, status: :unauthorized unless logged_in?
	end
end