class Medium < ActiveRecord::Base
  validates :description, :author_id, presence: true
  default_scope  {order('created_at DESC')}

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  has_one :picture, as: :imageable

  has_many(
    :likes,
    class_name: :Like,
    foreign_key: :media_id,
    primary_key: :id
  )

  has_many :likers, through: :likes, source: :user

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
