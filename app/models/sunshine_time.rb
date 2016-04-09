class SunshineTime < ApplicationRecord
  belongs_to :location
  before_save :default_values

  def default_values
    self.minutes_per_hour ||= ''
  end
end
