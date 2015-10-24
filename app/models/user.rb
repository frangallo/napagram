class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :password_digest, :session_token, :quote, presence: true
  validates :password, length:{minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token
  attr_accessor :password

  has_many(
    :comments,
    class: :Comment,
    foreign_key: :id,
    primary_key: :id,
    dependent: :destory
  )

  has_one :picture as: :imageable

  has_many(
    :following,
    class: :Follower,
    foreign_key: :follower_id,
    primary_key: :id,
  )

  has_many(
    :followers,
    class: :Follower,
    foreign_key: :followee_id,
    primary_key: :id,
  )

  has_many(
    :likes,
    class: :Like,
    foreign_key: :user_id,
    primary_key: :id,
  )

  has_many(
    :posts,
    class: :Media,
    foreign_key: :author_id,
    primary_key: :id,
  )


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(username,password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
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


end
