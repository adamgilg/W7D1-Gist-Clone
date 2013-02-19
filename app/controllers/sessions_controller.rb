class SessionsController < ApplicationController
  before_filter :require_login, except: [:new, :create]
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    if user
      user.reset_token
      session[:token] = user.token
      flash[:success] = "Logged in!"
      redirect_to root_url
    else
      flash[:error] = "Invalid login!"
      render new_session_path
    end
  end

  def destroy
    current_user.delete_token
    session[:token] = nil
    redirect_to root_url
  end
end
