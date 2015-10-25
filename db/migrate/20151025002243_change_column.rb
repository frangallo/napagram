class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :media, :title, :location
  end
end
