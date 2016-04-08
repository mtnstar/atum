require 'net/http'

class MeteoBlueClient

    def locations(query)
      locations = Array.new
      meteo_blue_result = meteo_blue_locations(query)
      json_result = JSON.parse(meteo_blue_result)
      json_result['results'].each do |l|
        locations << json_to_location(l)
      end
      locations
    end

    def json_to_location(l)
      Location.new(
        name: l['name'],
        country: l['country'],
        lat: l['lat'],
        region: l['admin1'],
        lon: l['lon'],
        asl: l['asl'],
        timezone: l['timezone']
      )
    end

    private

    def meteo_blue_locations(query)
      uri = URI('https://www.meteoblue.com/en/server/search/query3?query=' + query)
      Net::HTTP.get(uri)
    end
end
