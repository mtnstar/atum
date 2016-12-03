class DayForecast < ApplicationRecord

  attr_accessor :sunrise, :sunset, :hourly_yields, :day_yield

  belongs_to :sun_data_day
  belongs_to :pv_site
  belongs_to :location, through: :pv_site

  def update!
  end

  private
  def calculate_hourly_yield
    @hourely_kwh = Array.new(24,0)
    hourly_yield_calculator.hourly_yields
  end

  def yield_calculator
    @calculator ||=
      YieldCalculator.new(pv_site.max_production,
                                sun_data_day.date,
                                location.lat,
                                sun_data_day.sunshine_hours)
  end

end
