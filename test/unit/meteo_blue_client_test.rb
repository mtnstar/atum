class MeteoBlueClientTest < ActiveSupport::TestCase

  test 'collects dates' do
    dates =  ["2016-04-09 22:00",
              "2016-04-09 23:00",
              "2016-04-10 00:00",
              "2016-04-10 01:00",
              "2016-04-10 02:00"]
    results = client.send(:collect_dates, dates)
    assert_includes results, "2016-04-09"
    assert_includes results, "2016-04-10"
    assert_equal 2, results.size
  end

  test 'init dates value sets' do
    dates = ["2016-03-09", "2016-03-10"]
    results = client.send(:init_date_time_sets, dates)
    assert_equal 2, results.size
    assert_equal 24, results["2016-03-09"].size
    assert_equal 24, results["2016-03-10"].size
  end

  private

  def client
    MeteoBlueClient.new
  end
end
