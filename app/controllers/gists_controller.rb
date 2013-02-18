class GistsController < ApplicationController
  def index
    @gists = current_user.gists
  end

  def new
  end

  def create
  end
end
