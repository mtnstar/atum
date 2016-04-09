require "minitest/autorun"
require 'mocha/mini_test'
require 'test_helper'

class WeatherDataSyncJobTest < ActiveJob::TestCase
  test 'update sunshine times' do
    sunshine_time_date = sunshine_times(:one).date

    sunshine_times = []
    sunshine_times << SunshineTime.new(location_id: locations(:one).id,
                                       date: '2016-12-12'.to_date,
                                       minutes_per_hour: 'test1')

    sunshine_times << SunshineTime.new(location_id: locations(:one).id,
                                       date: sunshine_times(:one).date,
                                       minutes_per_hour: 'test2')

    #Mock
    MeteoBlueClient.any_instance.expects(:sunshine_times).returns(sunshine_times)

    WeatherDataSyncJob.perform_now

    assert_equal 'test1', SunshineTime.find_by(date: '2016-12-12'.to_date).minutes_per_hour
    assert_equal 1, SunshineTime.where(date: sunshine_time_date).count
    assert_equal 'test2', SunshineTime.find_by(date: sunshine_time_date).minutes_per_hour
    assert_equal 2, SunshineTime.count
  end
end
