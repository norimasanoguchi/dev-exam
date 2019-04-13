ActiveRecord::Schema.define(version: 20190205234359) do

  create_table "estates", force: :cascade do |t|
    t.string   "name"
    t.integer  "rent"
    t.string   "address"
    t.integer  "age"
    t.text     "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nearest_stations", force: :cascade do |t|
    t.string   "line"
    t.string   "station_name"
    t.integer  "distance_on_foot"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "estate_id"
    t.index ["estate_id"], name: "index_nearest_stations_on_estate_id"
  end

end
