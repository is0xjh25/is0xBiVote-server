class VoteRecordSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :vote_id, :vote_one, :vote_two, :status  
end
