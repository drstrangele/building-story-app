class Photo < ApplicationRecord
  belongs_to :story
  has_attached_file :img, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
