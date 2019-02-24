class CreateNearestStations < ActiveRecord::Migration[5.0]
  def change
    create_table :nearest_stations do |t|
      t.string :line
      t.string :station_name
      t.integer :distance_on_foot

      t.timestamps
    end
  end
end
