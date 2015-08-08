class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.belongs_to :album, index: true

      t.timestamps null: false
    end
  end
end
