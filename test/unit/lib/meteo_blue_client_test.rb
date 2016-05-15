# required, otherwise it's not possible to mock on MeteoBlueClient
require 'mocha/mini_test'

class MeteoBlueClientTest < ActiveSupport::TestCase

  #test 'collects dates' do
    #dates =  ["2016-04-09 22:00",
              #"2016-04-09 23:00",
              #"2016-04-10 00:00",
              #"2016-04-10 01:00",
              #"2016-04-10 02:00"]
    #results = client.send(:collect_dates, dates)
    #assert_includes results, "2016-04-09"
    #assert_includes results, "2016-04-10"
    #assert_equal 2, results.size
  #end

  #test 'init dates value sets' do
    #dates = ["2016-03-09", "2016-03-10"]
    #results = client.send(:init_date_time_sets, dates)
    #assert_equal 2, results.size
    #assert_equal 24, results["2016-03-09"].size
    #assert_equal 24, results["2016-03-10"].size
  #end

  test 'searchs for locations at meteo blue and returns entries as Location' do
    client.expects(:public_http_request).
      with('/en/server/search/query3', {query: 'Bern'}).
      returns(locations_response)

    locations = client.locations('Bern')

    assert_equal 'Bern', locations.first.name
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
