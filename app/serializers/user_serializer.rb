class UserSerializer < ActiveModel::Serializer
	attributes :id, :username, :email, :statistics

	def statistics
		
		data = {}

		data[:total_votes] = count_total_votes
		data[:being_majority] = count_being_majority
		data[:total_upvotes] = count_total_upvotes
		
		return data
	end

	private

	def count_total_votes
		
		query =
			"SELECT COUNT(*)
			FROM vote_records 
			WHERE user_id = #{object.id}"
		
		res = ActiveRecord::Base.connection.execute(query)
		output = res[0]['count']
		
		return output
	end

  	def count_being_majority

		# vote majority
		query =
			"SELECT match_vote.vote_id, match_vote.vote_two FROM
			(SELECT vote_id, MAX(count) FROM
			(SELECT vote_id, vote_two, COUNT (*) FROM vote_records
			GROUP BY vote_id, vote_two 
			HAVING vote_two = 'no' OR vote_two = 'yes') AS foo
			GROUP BY vote_id) AS max_vote
			INNER JOIN
			(SELECT vote_id, vote_two, COUNT (*) FROM vote_records
			GROUP BY vote_id, vote_two 
			HAVING vote_two = 'no' OR vote_two = 'yes') AS match_vote
			ON max_vote.vote_id = match_vote.vote_id AND max_vote.max = match_vote.count"

		res = ActiveRecord::Base.connection.execute(query)
		vote_majority = res

		# user vote
		query =
			"SELECT vote_id, vote_two from vote_records
			where user_id = #{object.id};"

		res = ActiveRecord::Base.connection.execute(query)
		user_vote = res

		count = 0
		user_vote.each do |u|
			vote_majority.each do |m| 
				count += 1 if u['vote_id'] == m['vote_id'] && u['vote_two'] == m['vote_two']
			end
		end

		return count
	end

	def count_total_upvotes
		
		query =
			"SELECT COUNT(*) FROM upvotes
			WHERE upvotes.post_id in (
			SELECT posts.id FROM posts
			WHERE posts.user_id = #{object.id})" 

		res = ActiveRecord::Base.connection.execute(query)
      	output = res[0]['count']
		
		return output
	end


end
