require 'net/http'

class MeteoBlueClient

  PUBLIC_BASE_URL = 'https://www.meteoblue.com'
  RESTRICTED_BASE_URL = 'https://my.meteoblue.com'
  API_KEY = ENV['METEO_BLUE_API_KEY']

  def locations(query)
    response = meteo_blue_locations(query)
    entries = JSON.parse(response)['results']
    entries.collect do |e|
      to_location(e)
    end
  end

  def create_location(entry)
    location = to_location(entry)
    location.save
  end

  def create_pv_site(entry)
    pv_site = to_pv_site(entry)
    pv_site.save
  end

  def sunshine_times(location)
    path = '/packages/clouds-1h'
    params = { lat: location.lat.to_s,
               lon: location.lon.to_s,
               asl: location.asl.to_s
    }

    response_data = restricted_http_request(path, params)
    data_1h = JSON.parse(response_data)['data_1h']
    date_time_values = collect_date_time_values(data_1h['time'], data_1h['sunshinetime'])
    to_sunshine_times(date_time_values, location)
  end

  private
  def to_pv_site(entry)
    location_id = Location.find_by(lat: pv['lat'], lon: pv['lon']).id
    PvSite.new(
      location_id: location_id,
      label: pv['label'],
      max_production: pv['max_production'],
      direction: pv['direction']
    )
  end

  def to_location(entry)
    Location.new(
      name: entry['name'],
      country: entry['country'],
      region: entry['admin1'],
      lat: entry['lat'],
      lon: entry['lon'],
      asl: entry['asl'],
      timezone: entry['timezone']
    )
  end

  def collect_date_time_values(date_times, values)
    date_time_values = {}
    date_times.each_with_index do |dt, i|
      date, time = dt.split(' ')
      unless date_time_values[date].present?
        date_time_values[date] = Array.new(24,0)
      end
      value = values[i]
      value_index = time.split(':').first.to_i
      date_time_values[date][value_index] = value
    end
    date_time_values
  end

  def to_sunshine_times(date_time_values, location)
    date_time_values.collect do |k,v|
      SunshineTime.new(
        location: location,
        date: Date.parse(k),
        minutes_per_hour: v
      )
    end
  end

  def meteo_blue_locations(query)
    path = '/en/server/search/query3'
    params = { query: query }
    public_http_request(path, params)
  end

  def restricted_http_request(path, params = {})
    params.merge!({ apikey: API_KEY})
    http_request(RESTRICTED_BASE_URL, path, params)
  end

  def public_http_request(path, params = {})
    http_request(PUBLIC_BASE_URL, path, params)
  end

  def http_request(base_url, path, params)
    uri = URI.parse(base_url)
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
    URI.encode(params.map { |k,v| "#{k}=#{v}" }.join("&"))
  end

end
