class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      #create sessionsHelper to login & call it here on @user
      #flash notice - successful login
      redirect_to root_path
    else
      #flash error - login failed
      redirect_to login_path
    end
  end

  def destroy
    #create sessions to logout the user & call it here
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
