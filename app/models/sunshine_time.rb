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
  before_save :default_values
  validates_uniqueness_of :date, scope: [:location_id]

  def default_values
    self.minutes_per_hour ||= ''
  end
end
