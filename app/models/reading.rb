class Reading < ActiveRecord::Base
	#attr_accessible :name, :time
	def self.search(user_id)
		Reading.find_by user_id: user_id
  	end
end
