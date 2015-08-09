class HomeController < ApplicationController
  def index
    @albums = Album.all.select{ |album| album.page.nil? }
    @page = Page.find 'homepage'
  end
  def about
    @page = Page.find 'about'
  end
  def album
    @album = Album.find params[:id]
  end
end
