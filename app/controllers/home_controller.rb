class HomeController < ApplicationController
  def index
    setup_filters

    @albums = []
    @images = []

    if params[:grid]
      if params[:tagged]
        @images = Image.visible.tagged_with params[:tagged]
      else
        @images = Image.visible
      end
    else
      if params[:tagged]
        @albums = Album.published.tagged_with params[:tagged]
      else
        @albums = Album.published
      end
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
  
  private
  def setup_filters
    @tags = ActsAsTaggableOn::Tag.all
  end
end
