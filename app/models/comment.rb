class Comment < ActiveRecord::Base
  validates :body, :author_id, :media_id, presence: true
  default_scope {order('created_at DESC')}

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to(
    :post,
    class_name: :Media,
    foreign_key: :media_id,
    primary_key: :id
  )


end
