class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.column "name", :string, null: false
      t.column "country", :string, null: false
      t.column "region", :string
      t.column "lat", :integer, null: false
      t.column "lon", :integer, null: false
      t.column "asl", :integer, null: false
      t.column "timezone", :string, null: false
    end
  end
end
