class Like < ActiveRecord::Base
  validates :user_id, :media_id, presence: :true
  validates :user, uniqueness: { scope: :post }

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :post,
    class_name: :Medium,
    foreign_key: :media_id,
    primary_key: :id
  )

end
