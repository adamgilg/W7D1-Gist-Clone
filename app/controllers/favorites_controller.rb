class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.gist_id = params[:gist_id]
    @favorite.user = current_user
    if @favorite.save
      render :nothing => true, :status => 200 # success!
    else
      render :nothing => true, :status => 500 # error! :(
    end
  end

  def destroy
    @favorite = Favorite.where(user_id: current_user.id, gist_id: params[:gist_id]).first
    if @favorite.destroy
      render :nothing => true, :status => 200 # success!
    else
      render :nothing => true, :status => 500 # error! :(
    end
  end
end
