class WeatherDataSyncJob < ApplicationJob
  RUN_EVERY = 1.minute

  queue_as :default

  def perform
    Location.all.each do |l|
      sunshine_time_data = meteo_client.sunshine_times(l)
      sunshine_time_data.each do |std|
        update_sunshine_time(l.id, std.date, std.minutes_per_hour)
      end
    end
  end

  private

  def update_sunshine_time(location_id, date, times)
    SunDataDay.create_with(minutes_per_hour: times).
      find_or_create_by(location_id: location_id, date: date)
  end

  def meteo_client
    @meteo_client ||= MeteoBlueClient.new
  end
end
