class SessionsController < ApplicationController
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
      render new_sessions_path
    end
  end

  def destroy
    session[:token] = nil
    current_user.delete_token
  end
end
