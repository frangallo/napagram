class Follower < ActiveRecord::Base
  validates :follower_id, :followee_id, presence: :true
  
  belongs_to :user
  belongs_to :follower, class_name: :User
end
