class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :url, null: false
      t.string :thumb_url
      t.integer :imageable_id
      t.string  :imageable_type
    end
    add_index(:pictures, [:imageable_type, :imageable_id])
  end
end
