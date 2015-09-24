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

    next_album_index = @albums.find_index(@album) + 1
    if next_album_index == @albums.count
      next_album_index = 0
    end

    previous_album_index = @albums.find_index(@album) - 1
    if previous_album_index == -1
      previous_album_index = @albums.count - 1
    end

    @next_album = @albums[next_album_index]
    @previous_album = @albums[previous_album_index]

  end

  private
  def setup_filters
    @tags = ActsAsTaggableOn::Tag.all.order('position asc')
  end
end
