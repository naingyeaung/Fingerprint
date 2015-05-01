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
	end
	def create
        @reading = Reading.new(user_params)
		@reading.time = DateTime.current()
		if @reading.user_id != nil and !Reading.search(@reading.user_id)
			@reading.save
			flash[:success] = "Successful"
			redirect_to readings_path
		else
			@reading = Reading.new
			flash[:fail] = "duplicate"
			render action: "new"
		end
	end
end
