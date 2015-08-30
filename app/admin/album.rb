ActiveAdmin.register Album do
  permit_params :name, :description, :tag_list, :file, :background_color, :published
  
  sortable
  config.sort_order = 'position_asc'
  config.paginate   = false

  index do
    sortable_handle_column
    selectable_column
    column :name
    column :published
    column "Images" do |album|
      album.images.count 
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
    if f.object.id
      para link_to "Edit Album Images", admin_album_images_path(album)
    else
      para "You'll add Images to this album once it's created."
    end

    f.inputs "Album Details" do
      f.input :file, as: :file, hint: image_tag(f.object.file.url(:thumb))
      f.input :name
      f.input :description, as: :text, :input_html => { :rows => 6 } 

      f.input :tag_list,
        label: "Tags",
        input_html: {
          data: {
            placeholder: "Enter tags",
            saved: f.object.tags.map{|t| {id: t.name, name: t.name}}.to_json,
            url: autocomplete_tags_path },
          class: 'tagselect'
        }
      
      f.input :background_color, input_html: { class: 'minicolors', value: album.settings(:base).background_color }
      f.input :published, as: :boolean
    end
    f.actions
  end
end
