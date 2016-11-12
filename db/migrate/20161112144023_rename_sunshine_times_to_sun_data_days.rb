class RenameSunshineTimesToSunDataDays < ActiveRecord::Migration
  def change
    rename_table :sunshine_times, :sun_data_days
  end
end
