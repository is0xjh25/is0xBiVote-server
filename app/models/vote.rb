class Vote < ApplicationRecord
	validates :name, presence: true
	validates :type, :inclusion => { :in => %w(world mystery sport entertainment ) }
	validates :start_time, presence: true
	validates :end_time, presence: true
end
