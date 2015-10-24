class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :follower_id, null: false
      t.integer :followee_id, null: false
    end
    add_index(:followers, [:follower_id, :followee_id])
  end
end
