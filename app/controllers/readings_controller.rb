class ReadingsController < ApplicationController
	def user_params
	    params.require(:reading).permit(:name, :time)
	end

	def getreadings
		@created_data = Reading.new()
		#@created_data.id = 1.0
		@created_data.name = 'Naing'
		@created_data.time = DateTime.current()
		@created_data.save
		#name_person = 'params[:name]'
		name_person = 'Naing'
		@data = Reading.search(name_person)

		#name_person = Reading.search(params[:name])
		
		#grab all the data regarding the person if it exists: date, time logged in, time logged out.
		#if not, direct to the prev url, saying the person does not exist.
	end
	def createreadings
        user_params()
		if params[:reading].present? && !params[:reading].nil?
			@reading = Reading.new(params[:reading])
	        @reading.save
		end
		redirect_to @reading
	end
end
