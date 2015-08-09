class AddPageToAlbums < ActiveRecord::Migration
  def change
    add_reference :pages, :album, index: true
  end
end
