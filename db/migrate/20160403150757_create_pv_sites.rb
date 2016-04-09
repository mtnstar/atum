class CreatePvSites < ActiveRecord::Migration[5.0]
  def change
    create_table :pv_sites do |t|
      t.integer :location_id
      t.string :label
      t.integer :max_production
      t.integer :direction

      t.timestamps
    end
  end
end
