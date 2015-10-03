ActiveAdmin.register ActsAsTaggableOn::Tag, as: "Tag" do
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

  action_item :all_albums, only: [:edit, :show] do
    link_to 'View all albums', admin_albums_path()
  end

  form do |f|
    f.inputs "Album Details" do
      f.input :name
    end

    if f.object.id
      div class: 'sortable', 'data-tag-id': "#{f.object.id}" do
        f.object.ordered_images.each do |image|
          div class: 'sortable-item', 'data-id': "#{image.id}" do
            div do
              link_to(image_tag(image.file.url(:thumb)), edit_admin_album_path(image.album))
            end
            div do
              if image.visible
                para "Visible (From album: #{image.album.name})"
              else
                para "Not Visible (From album: #{image.album.name})"
              end
            end
          end
        end
      end
    end
    f.actions
  end
end
