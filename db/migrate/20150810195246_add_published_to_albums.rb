class AddPublishedToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :published, :boolean
  end
end
