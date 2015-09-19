class HomeController < ApplicationController
  def index
    setup_filters

    @albums = []
    @images = []
    @photo_grid = false
    @tagged = false

    if params[:grid]
      @photo_grid = true
      if params[:tagged]
        @tagged = true
        @images = Image.visible.tagged_with params[:tagged]
      else
        @images = Image.visible
      end
    else
      @albums = Album.published
    end

    @page = Page.find 'homepage'
    @images = @page.album.images
  end

  def about
    @page = Page.find 'about'
  end

  def album
    @albums = Album.published
    @album = Album.find params[:id]
    @referrer = params[:referrer]

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
