class GistsController < ApplicationController
  def index
    @gists = current_user.gists
  end

  def new
    @gist = Gist.new
    @gist.gist_files.build
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
    respond_to do |format|
      format.json { render json: Tag.all }
      format.html
    end
  end

  def update
    @gist = Gist.find(params[:id])
    tag_ids = @gist.tag_ids
    tags = (params[:gist][:tag_ids] + tag_ids).uniq
    @gist.tag_ids = tags
    # @gist.update_attributes(params[:gist])
    @gist.save
    redirect_to @gist
  end
end
