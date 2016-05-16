class UpdateLocationAttributes < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :lat, :decimal, precision: 10, scale: 6
    change_column :locations, :lon, :decimal, precision: 10, scale: 6
    change_column :locations, :timezone, :string, null: true
  end
end
