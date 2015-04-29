class Reading < ActiveRecord::Base
	#attr_accessible :name, :time
	def self.search(name)
		Reading.where(["name = ?", name])
	end
end
