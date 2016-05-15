require 'net/http'

class MeteoBlueClient

  def locations(query)
    meteo_blue_result = meteo_blue_locations(query)
    json_result = JSON.parse(meteo_blue_result)['results']
    json_result.collect do |l|
      params_to_location(l)
    end
  end

  def create_location(params)
    params_to_location(params).save
  end

  def create_pv_site(params)
    require "pry"; binding.pry
    params_to_pv_site(params).save
  end

  private

  def params_to_pv_site(pv)
    location_id = Location.find_by(lat: pv['lat'], lon: pv['lon']).id
    PvSite.new(
        location_id: location_id,
        label: pv['label'],
        max_production: pv['max_production'],
        direction: pv['direction']
    )
  end

  def params_to_location(l)
    Location.new(
        name: l['name'],
        country: l['country'],
        region: l['admin1'],
        lat: l['lat'],
        lon: l['lon'],
        asl: l['asl'],
        timezone: l['timezone']
    )
  end

  def meteo_blue_locations(query)
    uri = URI('https://www.meteoblue.com/en/server/search/query3?query=' + query)
    Net::HTTP.get(uri)
  end
end
