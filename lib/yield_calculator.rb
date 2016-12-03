class YieldCalculator

  #
  # max_yearly_day_yield: the pv sites max possible day production in a year
  # date: the date to calculate yield for
  # lat: the locations latitude
  # sunshine_hours: number of hours the sun is shining at given date and latitude (day length)
  #

  def initialize(max_yearly_day_yield, date, lat, sunshine_hours)
    @max_yearly_day_yield = max_day_yield
    @date = date
    @lat = lat
    @sunshine_hours = sunshine_hours
  end

  # sunshine_mins:  provide an array with 24 items each representing 
  #                 the number of minutes of expected sunshine
  def hourly_yields(sunshine_mins)
    sunshine_mins.collect!.with_index do |m, h|
      hourly_yield(h, m)
    end
  end

  private
  # hour: 0-23
  # sunshine_minutes: number of minutes of sunshine during the given hour
  def hourly_yield(hour, sunshine_minutes)
  end

  def max_day_yield
  end

  def day_int
    (@date - Date.new(@date.year,12,21)).to_i
  end

end
