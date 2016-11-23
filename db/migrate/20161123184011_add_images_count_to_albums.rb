class AddImagesCountToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :images_count, :integer
  end
end
