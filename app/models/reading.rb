class Reading < ActiveRecord::Base
	#attr_accessible :name, :time
	def self.search(parameter)
		result = Reading.where(:name => parameter)
		if !result
			result = Reading.where(:user_id => parameter)
		end
		return result
  	end
end
