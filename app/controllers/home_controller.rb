class HomeController < ApplicationController
  def index
    @albums = Album.all
  end
  def about
  end
  def album
    @album = Album.find params[:id]
  end
end
