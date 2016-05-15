# seems to be needed for production env, why ?
require "#{Rails.root}/lib/meteo_blue_client"

class ApplicationController < ActionController::API

  before_filter :current_user, :cors_options_headers
  after_filter :cors_headers

  def cors_options_headers
    if request.method == :options
      cors_headers
      render :text => '', :content_type => 'text/plain'
    end
  end

  def cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def current_user
  end

  protected
  def meteo_client
    @meteo_client ||= MeteoBlueClient.new
  end
end
