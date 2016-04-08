class Api::LocationsController < Api::ApiController

  # GET /api/locations
  def index
    query = params[:query]
    return unless query

    locations = meteo_client.locations(query)
    render json: locations
  end
end
