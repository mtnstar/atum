require 'net/http'

class MeteoBlueClient

  BASE_URL = 'https://www.meteoblue.com'
  API_KEY = ENV['METEO_BLUE_API_KEY']

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
    params_to_pv_site(params).save
  end

  def sunshine_times(location)
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

  def collect_date_times(dates)
  end

  def create_pv_site(params)
    params_to_pv_site(params).save
  end

  def meteo_blue_locations(query)
    path = '/en/server/search/query3'
    params = { query: query }
    http_request(path, params)
  end

  def http_request(path, params = {})
    uri = URI.parse(BASE_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    query = "#{path}?#{params_to_query(params)}"

    request = Net::HTTP::Get.new(query)
    response = http.request(request)

    if response.code.to_i != 200
      raise "meteoblue returned http error code: #{response.code}"
    end

    response.body
  end

  def params_to_query(params)
    params.merge!({ apikey: API_KEY})
    URI.encode(params.map { |k,v| "#{k}=#{v}" }.join("&"))
  end

end
