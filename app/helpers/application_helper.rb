module ApplicationHelper

  def require_login
    unless logged_in?
      flash[:error] = "not logged in"
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    unless session[:token].nil?
      @current_user = User.find_by_token(session[:token])
    else
      nil
    end
  end

end
