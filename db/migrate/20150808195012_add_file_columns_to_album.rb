class AddFileColumnsToAlbum < ActiveRecord::Migration
  def up
    add_attachment :albums, :file
  end

  def down
    remove_attachment :albums, :file
  end
end
