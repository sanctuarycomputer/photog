ActiveAdmin.register Image do
  belongs_to :album
  permit_params :caption, :file, :tag_list, :visible

  sortable
  config.sort_order = 'position_asc'
  config.paginate   = false

  index do
    sortable_handle_column
    selectable_column
    column :visible
    column "Thumbnail" do |image|
      image_tag(image.file.url(:thumb))
    end
    column :caption
    actions
  end

  form do |f|
    f.inputs "Image Details" do
      f.input :file, as: :file, hint: image_tag(f.object.file.url(:thumb))
      f.input :caption
      
      f.input :tag_list,
        label: "Tags",
        input_html: {
          data: {
            placeholder: "Enter tags",
            saved: f.object.tags.map{|t| {id: t.name, name: t.name}}.to_json,
            url: autocomplete_tags_path },
          class: 'tagselect'
        }

      unless f.object.id
        f.object.visible = true
      end
      f.input :visible, as: :boolean
    end
    f.actions
  end

  show do |image|
    div do 
      image_tag(image.file.url(:thumb))
    end
    para link_to "Add Another Image To This Album", new_admin_album_image_path(image.album)
    para link_to "See All Albums", admin_albums_path
  end

end
