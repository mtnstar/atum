class DayForecast

  attr_accessor :sunrise, :sunset, :hourely_kwh

  delegate :location, to: :pv_site

  def initalize(pv_site)
    @pv_site = pv_site
    calculate_hourly_kwh
  end

end
