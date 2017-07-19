module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def login user
    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:error] = "Please login"
      redirect_to login_path
    end
  end

  def is_owner? resource
     current_user.id == resource.user_id
  end

  def require_ownership
    unless current_user.stories.ids.include?(params[:id]) || current_user.stories.ids.include?(params[:id].to_i)
      flash[:error] = "You are not authorized to access this section."
      redirect_to root_path
    end
  end

end
