class Comment < ActiveRecord::Base
  validates :body, :author_id, :media_id, presence: true

  belongs_to(
    :author,
    class: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to(
    :post,
    class: :Media,
    foreign_key: :media_id,
    primary_key: :id
  )


end
