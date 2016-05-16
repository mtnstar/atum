require 'test_helper'

class MeteoBlueClientTest < ActiveSupport::TestCase

  test 'returns sunshine times by location' do
    basel = locations(:basel)

    client.expects(:restricted_http_request).
      with('/packages/clouds-1h', {lat: '47.5584', lon: '7.57327', asl: '279'}).
      returns(cloud_1h_response)

    sunshine_times = client.sunshine_times(basel)
    assert_equal 8, sunshine_times.size

    st1 = sunshine_times.first
    assert_equal Date.parse('15.05.2016'), st1.date
    assert_equal [0,0,0,0,0,0,0,0,0,13,17,13,36,36,38,12,12,37,37,22,10,0,0,0], st1.minutes_per_hour

    st6 = sunshine_times[5]
    assert_equal Date.parse('20.05.2016'), st6.date
    assert_equal [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], st6.minutes_per_hour

    st7 = sunshine_times[6]
    assert_equal Date.parse('21.05.2016'), st7.date
    assert_equal [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,10,0,0,0,0], st7.minutes_per_hour

    st8 = sunshine_times.last
    assert_equal Date.parse('22.05.2016'), st8.date
    assert_equal [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], st8.minutes_per_hour

  end

  test 'searchs for locations at meteo blue and returns entries as Location' do
    client.expects(:public_http_request).
      with('/en/server/search/query3', {query: 'Bern'}).
      returns(locations_response)

    location_results = client.locations('Bern')

    assert_equal 'Bern', location_results.first.name
  end

  private

  def client
    @client ||= MeteoBlueClient.new
  end

  def cloud_1h_response
    File.read("#{Rails.root}/test/fixtures/meteo_blue/clouds-1h_response.json")
  end

  def locations_response
    File.read("#{Rails.root}/test/fixtures/meteo_blue/locations_response.json")
  end

end
