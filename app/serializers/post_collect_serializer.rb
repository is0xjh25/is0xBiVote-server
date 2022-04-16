class PostCollectSerializer < ActiveModel::Serializer
	attributes :yes, :no

	def yes
		
		query =
			"SELECT id FROM posts
			WHERE vote_id = #{object.id} AND vote_two = 'yes'"

		res = ActiveRecord::Base.connection.execute(query)
		output = res.map { |r| r['id'] }

		# output = []
		# posts.each do |p|
		# 	post = Post.find_by(id: p)
		# 	output.push(PostSerializer.new(post, user_id: @instance_options[:user_id]))
		# end

		return output
	end

	def no

		query =
			"SELECT id FROM posts
			WHERE vote_id = #{object.id} AND vote_two = 'no'"

		res = ActiveRecord::Base.connection.execute(query)
		output = res.map { |r| r['id'] }

		# output = []
		# posts.each do |p|
		# 	post = Post.find_by(id: p)
		# 	output.push(PostSerializer.new(post))
		# end

		return output
	end

	# def owned
		
	# 	if (@instance_options[:user_id] != nil)
	# 		query =
	# 			"SELECT id FROM posts
	# 			WHERE vote_id = #{object.id} AND user_id = #{@instance_options[:user_id]}"

	# 		res = ActiveRecord::Base.connection.execute(query)
	# 		post = Post.find_by(id: res[0]['id'])
			
	# 		output = PostSerializer.new(post)
	# 	else
	# 		output = {}
	# 	end

	# 	return output
	# end
end