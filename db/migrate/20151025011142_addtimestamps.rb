class Addtimestamps < ActiveRecord::Migration
  def change
    add_column(:comments, :created_at, :datetime)
    add_column(:comments, :updated_at, :datetime)
    add_column(:followers, :created_at, :datetime)
    add_column(:followers, :updated_at, :datetime)
    add_column(:likes, :created_at, :datetime)
    add_column(:likes, :updated_at, :datetime)
    add_column(:media, :created_at, :datetime)
    add_column(:media, :updated_at, :datetime)
    add_column(:pictures, :created_at, :datetime)
    add_column(:pictures, :updated_at, :datetime)
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
  end
end
