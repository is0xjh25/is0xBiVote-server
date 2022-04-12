class PostCollectSerializer < ActiveModel::Serializer
	attributes :yes, :no, :owned

	def yes
		data = []
		return data
	end

	def no
		data = []
		return data
	end

	def owned
		data = {}
		return data
	end

end