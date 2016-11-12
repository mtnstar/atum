# == Schema Information
#
# Table name: sun_data_days
#
#  id               :integer          not null, primary key
#  location_id      :integer          not null
#  date             :date             not null
#  minutes_per_hour :string           not null
#

require 'test_helper'

class SunDataDayTest < ActiveSupport::TestCase

  test 'calculates max sunshine hours for given date and location' do
    sunshine_time = SunshineTime.new
    sunshine_time.date = Date.parse('2016-03-21')
    sunshine_time.location = locations(:basel)

    assert_equal 12.25, sunshine_time.max_sunshine_hours
  end

end
