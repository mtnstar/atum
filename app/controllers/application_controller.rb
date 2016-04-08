class ApplicationController < ActionController::API

  def current_user
  end

  protected
  def meteo_client
    @meteo_client ||= MeteoBlueClient.new
  end 
end
