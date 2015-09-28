ActiveAdmin.register Album do
  permit_params :name, 
                :description, 
                :delete_cover_image, 
                :tag_list, :file, 
                :background_color, 
                :published, 
                images_attributes: [
                  :id, 
                  :child_image_file, 
                  :delete_child_image, 
                  :album_id, 
                  :position, 
                  :file, 
                  :caption, 
                  :tag_list, 
                  :visible, 
                  :_destroy
                ]
  
  sortable
  config.sort_order = 'position_asc'
  config.paginate   = false

  controller do
    after_update do |album|
      image_attrs = permitted_params[:album][:images_attributes]

      if image_attrs
        image_attrs.each do |array|
          hash = array[1]
          if hash[:id] && Image.exists?(hash[:id])
            image = Image.find(hash[:id])
            image.setup_child_image hash[:child_image_file], hash[:delete_child_image]
          end
        end
      end

    end
  end

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

  form do |f|
    f.inputs "Album Details" do
      f.input :file, as: :file, hint: f.object.file.exists? ? image_tag(f.object.file.url(:thumb)) : nil

      if (f.object.file.present?)
        f.input :delete_cover_image, as: :boolean, :required => false, :label => 'Remove image'
      end

      f.input :name
      # f.input :description, as: :text, :input_html => { :rows => 6 }

      f.input :background_color, input_html: { class: 'minicolors', value: album.settings(:base).background_color }
      f.input :published, as: :boolean
    end

    f.inputs do
      f.has_many :images, sortable: :position, allow_destroy: true do |f|

        f.input :file, :as => :file, :hint => f.object.file.exists? ? f.template.image_tag(f.object.file.url(:thumb)) : nil
      
        if f.object.id
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
       
          f.input :album

          f.input :child_image_file, :label => "Editorial Image", :as => :file, :hint => f.object.child_image && f.object.child_image.file.exists? ? f.template.image_tag(f.object.child_image.file.url(:thumb)) : nil
          if (f.object.child_image && f.object.child_image.file.exists?)
            f.input :delete_child_image, as: :boolean, :required => false, :label => 'Remove Editorial Image'
          end

          f.input :visible, as: :boolean
        end
      end
    end

    f.actions
  end
end
