class CreateHoneymoonItems < ActiveRecord::Migration
  def change
    create_table :honeymoon_items do |t|
      t.string :description
      t.string :url
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end
end