class ServerRequestsController < ApplicationController
	def server_post
		@reading = Reading.new
		@reading.name = params[:name]
		@reading.user_id = params[:user_id]
		@reading.time = DateTime.current()
		@reading.save
        potential_matching_data = Reading.search(@reading.user_id)
		if @reading.user_id != nil
			@reading.save
			flash[:success] = "Successful"
			redirect_to readings_path
		else
			flash[:success] = "Fail to Update"
			redirect_to readings_path
		end
	end
end
