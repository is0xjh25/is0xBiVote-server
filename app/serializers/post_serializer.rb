class PostSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :vote_id, :content, :vote_two ,:poster, :upvotes, :upvoted

	def poster
		
		query =
			"SELECT username FROM users
			WHERE id = #{object.user_id}"
	
		res = ActiveRecord::Base.connection.execute(query)
		output = res[0]['username']
		
		return output
	end

	def upvotes
		
		query =
			"SELECT COUNT(*) FROM upvotes
			WHERE post_id = #{object.id}"

		res = ActiveRecord::Base.connection.execute(query)
		output = res[0]['count']

		return output	
	end

	def upvoted
		upvoted = Upvote.find_by(post_id: object.id, user_id: @instance_options[:user_id])
		return upvoted.present?
	end
end