class PostCollectSerializer < ActiveModel::Serializer
	attributes :yes, :no

	def yes
		
		query =
			"SELECT posts.id FROM posts
			INNER JOIN upvotes ON posts.id = upvotes.post_id
			WHERE vote_id = #{object.id} AND vote_two = 'yes'
			GROUP BY posts.id
			ORDER BY COUNT(*) DESC"

		res = ActiveRecord::Base.connection.execute(query)
		output = res.map { |r| r['id'] }

		return output
	end

	def no

		query =
			"SELECT posts.id FROM posts
			INNER JOIN upvotes ON posts.id = upvotes.post_id
			WHERE vote_id = #{object.id} AND vote_two = 'no'
			GROUP BY posts.id
			ORDER BY COUNT(*) DESC"

		res = ActiveRecord::Base.connection.execute(query)
		output = res.map { |r| r['id'] }

		return output
	end
end