class AddEstateRefToNearestStation < ActiveRecord::Migration[5.0]
  def change
    add_reference :nearest_stations, :estate, foreign_key: true
  end
end
