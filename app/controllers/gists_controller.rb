class GistsController < ApplicationController
  def index
    @gists = current_user.gists
  end

  def new
    @gist = Gist.new
    3.times { @gist.gist_files.build }
  end

  def create
    gist = Gist.new(params[:gist])
    gist.user_id = current_user.id
    if gist.save
      redirect_to root_path
      flash[:success] = "Gist successfully saved!"
    else
      flash[:error] = "Couldn't save gist - try again."
      render new
    end
  end

  def show
    @gist = Gist.find(params[:id])
  end
end
