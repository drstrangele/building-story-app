class Building < ApplicationRecord
  has_many :stories
  has_many :photos, through: :stories

  geocoded_by :address, :latitude  => :lat, :longitude => :long
  after_validation :geocode

  # def address
  #   [street, city, state, country].compact.join(', ')
  # end
end
