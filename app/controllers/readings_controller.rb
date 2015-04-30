class ReadingsController < ApplicationController
	def user_params
	    params.require(:reading).permit(:name, :user_id, :time)
	end
    def new
    	@reading = Reading.new
    end
    def index
    	@readings = Reading.all
    end
	def show
		#name_person = 'params[:name]'
		name_person = params[:id]
		@data = Reading.search(name_person)
		@new_data = Reading.new

		#name_person = Reading.search(params[:name])
		
		#grab all the data regarding the person if it exists: date, time logged in, time logged out.
		#if not, direct to the prev url, saying the person does not exist.
	end
	def create
        @reading = Reading.create(user_params)
        #@reading.user_id = params[:user_id]
		#@reading.name = params[:name]
		@reading.time = DateTime.current()
		if @reading.save and @reading.user_id != nil
			flash[:success] = "Successful"
			redirect_to readings_path
		else
			render action: "new"
			#redirect_to "readings/createreadings"
		end
	end
end
