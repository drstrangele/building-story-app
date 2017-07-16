class User < ApplicationRecord
  has_secure_password
  has_many :stories
  has_many :photos, through: :stories

  REGEX_VALID_EMAIL = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, presence: true
  validates :password, length: {minimum: 3}
  validates :email, presence: true,
    uniqueness: true,
    length: {maximum: 60},
    format: {with: REGEX_VALID_EMAIL}

  def self.confirm params
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
