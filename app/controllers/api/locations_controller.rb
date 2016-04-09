class Api::LocationsController < Api::ApiController

  # GET /api/locations
  def index
    query = params[:query]

    return unless query

    locations = meteo_client.locations(query)
    render json: {data: locations}
  end

  # POST /api/locations
  def create
    meteo_client.create_location(params)
  end
end
