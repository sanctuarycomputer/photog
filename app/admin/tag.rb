ActiveAdmin.register ActsAsTaggableOn::Tag do
  menu label: "Tags"
  permit_params :name
  
  sortable
  config.sort_order = 'position_asc'
  config.paginate   = false

  controller do
    before_filter { @page_title = "Tags" }
  end

  index do
    sortable_handle_column
    selectable_column
    column :name
    column "Tagged Images" do |tag|
      Image.tagged_with(tag).count
    end
    actions
  end

  show do
    div do 
      image_tag(album.cover_image.url(:thumb))
    end
    para link_to "Edit Album Images", admin_album_images_path(album)
    para link_to "Edit Album Details", edit_admin_album_path(album)
  end

  action_item :all_albums, only: [:edit, :show] do
    link_to 'View all albums', admin_albums_path()
  end

  form do |f|
    f.inputs "Album Details" do
      f.input :name
    end
    
    Image.tagged_with(f.object).each do |image|
      para link_to image_tag(image.file.url(:thumb)), edit_admin_album_path(image.album)
    end
    f.actions
  end
end
