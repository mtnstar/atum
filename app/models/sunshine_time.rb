# == Schema Information
#
# Table name: sunshine_times
#
#  id               :integer          not null, primary key
#  location_id      :integer          not null
#  date             :date             not null
#  minutes_per_hour :string           not null
#

class SunshineTime < ApplicationRecord
  belongs_to :location
  validates_uniqueness_of :date, scope: [:location_id]

  def minutes_per_hour
    value = read_attribute(:minutes_per_hour)
    value[1..-2].split(',').collect {|v| v.to_i}
  end

end
