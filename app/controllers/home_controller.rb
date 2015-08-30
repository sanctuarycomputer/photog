class HomeController < ApplicationController
  def index
    @albums = []
    @images = []

    if params[:grid]
      @images = Image.visible
    else
      @albums = Album.published
    end
    
    @page = Page.find 'homepage'
    @image = @page.album.images.sample
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
