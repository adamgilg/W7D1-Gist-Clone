module ApplicationHelper

  def require_login
    unless logged_in?
      flash[:error] = "please log in"
      redirect_to new_sessions_path
    end
  end

  def logged_in?
    puts current_user
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
