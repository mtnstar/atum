class CreateSunshineTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :sunshine_times do |t|
      t.column "location_id", :integer, null: false
      t.column "date", :date, null: false
      t.column "minutes_per_hour", :string, null: false
    end
  end
end
