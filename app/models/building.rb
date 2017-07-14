class Building < ApplicationRecord
  has_many :stories
  has_many :photos, through: :stories
end
