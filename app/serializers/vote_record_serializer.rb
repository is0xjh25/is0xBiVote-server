class VoteRecordSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :vote_id, :vote_one, :vote_two, :status, :owned_post

  def owned_post
    post = Post.find_by(vote_id: object.vote_id, user_id: object.user_id)

    if post
      output = PostSerializer.new(post)
    else
      output = {}
    end

    return output
  end
end
