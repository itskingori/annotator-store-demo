# This migration comes from annotator_store (originally 20150112121233)
class CreateImageAnnotationsStore < ActiveRecord::Migration
  def change
    create_table :annotator_store_image_annotations do |t|
      t.string :page_url, index: true
      t.string :url
      t.text :text
      t.string :shape
      t.string :units
      t.string :geometry
    end
  end
end
