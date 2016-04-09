require 'net/http'

class MeteoBlueClient

    def locations(query)
      meteo_blue_result = meteo_blue_locations(query)
      json_result = JSON.parse(meteo_blue_result)['results']
      json_result.collect do |l|
        params_to_location(l)
      end
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

    def create_location(params)
      params_to_location(params).save
    end

# app.post('http://localhost/api/locations?name=test&country=test&lat=21&lon=12&region=test&asl=123&timezone=utc')

    private

    def meteo_blue_locations(query)
      uri = URI('https://www.meteoblue.com/en/server/search/query3?query=' + query)
      Net::HTTP.get(uri)
    end
end
