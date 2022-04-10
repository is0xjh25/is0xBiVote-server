class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :vote_id, :content
end
