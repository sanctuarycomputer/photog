class AddShowNameOnHoverToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :show_name_on_hover, :boolean
  end
end
