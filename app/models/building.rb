class Building < ApplicationRecord
  has_many :stories
  has_many :photos, through: :stories, dependent: :destroy

  geocoded_by :address, :latitude  => :lat, :longitude => :long
  after_validation :geocode

end
