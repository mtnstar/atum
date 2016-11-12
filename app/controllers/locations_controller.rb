class LocationsController < ApplicationController

  # GET /api/locations
  def index
    query = params[:query]

    return unless query

    locations = meteo_client.locations(query)
    render json: locations
  end

  # POST /api/locations
  def create
    meteo_client.create_location(params)
  end
end
