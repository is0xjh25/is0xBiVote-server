class VoteSerializer < ActiveModel::Serializer
    attributes :id, :name, :type, :start_time, :end_time, :status
end
