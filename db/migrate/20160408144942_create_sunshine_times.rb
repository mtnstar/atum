class CreateSunshineTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :sunshine_times do |t|
      t.column "location_id", :id, null: false
      t.column "date", :datetime, null: false
      t.column "minutes_per_hour", :string, null: false
    end
  end
end
