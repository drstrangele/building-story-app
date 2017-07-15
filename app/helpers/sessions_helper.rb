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
      #flash error message - you must be logged in to access this section
      redirect_to login_path
    end
  end

  def is_owner? resource
    current_user.id == resource.user_id
  end

  def require_ownership
    unless is_owner?
      ##################################
      #how to use this as a before_action & pass the 'resource' argument to is_owner? ????????
      ##################################


      #flash error message - you cannot edit or delete someone else's story
      redirect_to root_path
    end
  end

end
