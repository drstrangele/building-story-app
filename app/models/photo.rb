class Photo < ApplicationRecord
  belongs_to :story
  has_attached_file :img, styles: { med: "500x500" }

  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
