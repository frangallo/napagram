class Follower < ActiveRecord::Base
  validates :follower_id, :followee_id, presence: :true
  validates :followee, uniqueness: { scope: :follower_id }
  validates :follower, uniqueness: { scope: :followee_id }

  belongs_to :followee, class_name: :User, foreign_key: :followee_id
  belongs_to :follower, class_name: :User, foreign_key: :follower_id
end
