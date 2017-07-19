class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successful login"
      redirect_to root_path
    else
      flash[:error] = "Login failed"
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
