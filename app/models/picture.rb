class Picture < ActiveRecord::Base
  validates :url, presence: true

  belongs_to :imageable, polymorphic: true
end
