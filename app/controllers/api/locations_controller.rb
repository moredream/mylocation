module API
  class LocationsController < ApplicationController
    def index

      if note = params[:note]
        locations = Location.where(note: note)
	  else
        locations = Location.all
      end

      render json: locations, status: 200
    end
  end
end
