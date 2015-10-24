class FixPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :imageable_id, :integer
    remove_column :pictures, :imageable_type, :integer
    add_reference :pictures, :imageable, index: true, polymorphic: true
  end
end
