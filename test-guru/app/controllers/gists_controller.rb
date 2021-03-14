class GistsController < ApplicationController

  def index
    @gists = Gist.all
  end
  
  def show
    @gist = Gist.find(params[:id])
  end
end
