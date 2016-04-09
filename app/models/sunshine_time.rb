class SunshineTime < ApplicationRecord
  belongs_to :location
  before_save :default_values
  validates_uniqueness_of :date, scope: [:location_id]

  def default_values
    self.minutes_per_hour ||= ''
  end
end
