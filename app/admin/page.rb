ActiveAdmin.register Page do
  permit_params :name, :copy, :album_id, :title

  index do
    column :name
    column :title
    actions
  end

  show do
    if page.album
      para link_to "Edit the Attached Album", edit_admin_album_path(page.album)
    else
      para link_to "Attach an Album to this Page", edit_album_path(page)
    end
  end

  form do |f|
    if page.album
      para link_to "Edit the Attached Album", edit_admin_album_path(page.album)
    else
      para "This page does not have an attached album."
    end

    f.inputs "Page Details" do
      f.input :name
      f.input :title
      f.input :copy, as: :text, :input_html => { :rows => 6 }

      f.input :album_id, label: 'Album', 
                         as: :select, 
                         collection: Album.all.map{|a| ["#{a.name}", a.id]}, 
                         input_html: { class: 'standardselect' }
    end

    f.actions
  end
end
