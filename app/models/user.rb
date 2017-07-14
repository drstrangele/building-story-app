class User < ApplicationRecord
  has_secure_password
  has_many :stories
  has_many :photos, through: :stories
end
