class Story < ApplicationRecord
  belongs_to :user
  belongs_to :building
  has_many :photos
end
