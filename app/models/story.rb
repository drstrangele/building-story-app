class Story < ApplicationRecord
  belongs_to :user
  belongs_to :building
  has_many :photos, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200, allow_nill: false, message: "Can't be nil" }
  validates :description, presence: true

  accepts_nested_attributes_for :photos

end
