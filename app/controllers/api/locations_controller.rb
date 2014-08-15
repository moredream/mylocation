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

    private

    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude ,:name, :note)
    end
  end
end
