class AddVisibleToImages < ActiveRecord::Migration
  def change
    add_column :images, :visible, :boolean
  end
end
