class HomeController < ApplicationController
  def index
    @albums = Album.published
    @page = Page.find 'homepage'
  end
  def about
    @page = Page.find 'about'
  end
  def album
    @albums = Album.published
    @album = Album.find params[:id]

    index = @albums.find_index(@album) + 1
    if index == @albums.count
      index = 0
    end

    @next_album = @albums[index]
  end
end
