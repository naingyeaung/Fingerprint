class ReadingsController < ApplicationController
	def user_params
	    params.require(:reading).permit(:name, :user_id, :time)
	end
    def new
    	@reading = Reading.new
    end
    def index
    	@readings = Reading.search(params[:search])
    end
    def edit
    	redirect_to readings_path
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
		potential_matching_data = Reading.search(@reading.user_id)
		if @reading.user_id != nil and ((potential_matching_data.length == 0) or (potential_matching_data.name == @reading.name))
			@reading.save
			flash[:success] = "Successful"
			redirect_to readings_path
		else
			@reading = Reading.new
			flash[:fail] = "duplicate"
			render action: "new"
		end
	end
    def newtime
    	redirect_to "/reading/index"

    	@reading = Reading.new(user_params)
    	@reading.time = DateTime.current()

    	if @reading.save
    		flash[:success] = "Successful"
    	else
    		flash[:success] = "fail"
        end

    end
end
