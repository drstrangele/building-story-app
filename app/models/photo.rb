class Photo < ApplicationRecord
  belongs_to :story
  has_attached_file :img
end
