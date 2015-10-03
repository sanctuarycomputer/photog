class CreateTagOrders < ActiveRecord::Migration
  def change
    create_table :tag_orders do |t|
      t.belongs_to :tag, index: true
      t.text :image_ids

      t.timestamps null: false
    end
  end
end
