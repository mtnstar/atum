class CreatePvSites < ActiveRecord::Migration[5.0]
  def change
    create_table :pv_sites do |t|
      t.string :label
      t.string :location
      t.integer :max_production
      t.integer :direction
      t.references :user

      t.timestamps
    end
  end
end
