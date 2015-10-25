class Picture < ActiveRecord::Base
  validates :photo_url, presence: true

  belongs_to :imageable, polymorphic: true
end
