class ServerRequestsController < ApplicationController
	def server_post
		if params[:reading].present? && !params[:reading].nil?
			readings = params[:reading]
		end
	end
end
