class User < ApplicationRecord
  has_secure_password
  has_many :stories
  has_many :photos, through: :stories

  def self.confirm params
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
