# == Schema Information
#
# Table name: sun_data_days
#
#  id               :integer          not null, primary key
#  location_id      :integer          not null
#  date             :date             not null
#  minutes_per_hour :string           not null
#

require 'sun_times'

class SunDataDay < ApplicationRecord
  belongs_to :location
  validates_uniqueness_of :date, scope: [:location_id]

  def minutes_per_hour
    value = read_attribute(:minutes_per_hour)
    value[1..-2].split(',').collect {|v| v.to_i}
  end

  def max_sunshine_hours
    (sunset.change(sec: 0).to_i - sunrise.change(sec: 0).to_i) / 3600.0
  end

  # TODO date time based on location
  def sunrise
    @sunrise ||= sun_times.rise(date, location.lat, location.lon)
  end

  # TODO date time based on location
  def sunset
    @sunset ||= sun_times.set(date, location.lat, location.lon)
  end

  def timezone
    # get timezone by location
  end

  private
  def sun_times
    @sun_times ||= SunTimes.new
  end

end
