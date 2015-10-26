class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :password_digest, :session_token, :quote, presence: true
  validates :password, length:{minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token
  attr_accessor :password

  has_many(
    :comments,
    class_name: :Comment,
    foreign_key: :id,
    primary_key: :id,
    dependent: :destroy
  )

  has_one :picture, as: :imageable

  has_many(
    :active,
    class_name: :Follower,
    foreign_key: :follower_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :passive,
    class_name: :Follower,
    foreign_key: :followee_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :following, through: :active, source: :followee
  has_many :followers, through: :passive, source: :follower

  has_many(
    :likes,
    class_name: :Like,
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :liked_posts, through: :likes, source: :post

  has_many(
    :posts,
    class_name: :Medium,
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy
  )


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(username,password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def photo_likes_hash
    zipped_likes = likes.pluck(:media_id).zip(likes)
    likes_hash = {}

    zipped_likes.each do |(id, like)|
      likes_hash[id] = like
    end

    likes_hash
  end

  def follow!(user)
    return if user == self
    self.active.create!(following_id: user.id)
  end

  def unfollow!(user)
    self.active.find_by_following_id(user.id).destroy!
  end

  def following?(user)
    self.followees.include?(user)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def feed
    following_ids = Follower.select(:followee_id).where(follower_id: self.id).map(&:followee_id)
    following_ids << self.id
    Medium.includes(:likers, :picture, :author, comments: [:author]).where(:author_id => following_ids)
  end

end
