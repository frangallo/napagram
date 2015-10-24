class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title, null: false
      t.string :description, null:false
      t.integer :author_id, null: false
    end
    add_index(:media, :author_id)
  end
end
