class ChangeColumnNull < ActiveRecord::Migration
  def change
    change_column :media, :location, :string, null: true
  end
end
