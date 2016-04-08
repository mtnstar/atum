# seems to be needed for production env, why ?
require "#{Rails.root}/lib/meteo_blue_client"

class ApplicationController < ActionController::API

  def current_user
  end

  protected
  def meteo_client
    @meteo_client ||= MeteoBlueClient.new
  end 
end
