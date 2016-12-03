require 'minitest/autorun'

describe 'location Bern' do

  before do
    @lat = locations(:bern).lat
  end

  it 'forecasts the max possible yield on a sunny summer solstice day' do
    summer_solstice_day = Date.new(2016,6,21)
    calculator = HourlyYieldCalculator.new(42, summer_solstice_day, @lat, 14.0)

    hourly_yields = calculator(summer_solstice_day).hourly_yields(sunshine_mins)
    assert_equal 182, hourly_yields.send(:day_int)
    #day_yield = hourly_yields.sum
    #assert_equal 42.0, day_yield
  end

  it 'forecasts the max possible yield on a sunny winter solstice day' do
    summer_solstice_day = Date.new(2016,12,21)
    calculator = HourlyYieldCalculator.new(42, summer_solstice_day, @lat, 8.516)

    hourly_yields = calculator(summer_solstice_day).hourly_yields(sunshine_mins)
    assert_equal 0, hourly_yields.send(:day_int)
    #day_yield = hourly_yields.sum
    #assert_equal 42.0, day_yield
  end

end
