class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash notice - successfully joined
      login(@user)
      redirect_to root_path
    else
      #flash error - sign-up failed
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      login(@user)
      #flash notice - user info updated successfully
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to edit_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
