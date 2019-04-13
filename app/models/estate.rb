class Estate < ApplicationRecord
  validates :name, :rent, :address, :age, presence: true
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations
end
