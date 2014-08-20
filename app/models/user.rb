class User < ActiveRecord::Base

  has_many :subscriptions, inverse_of: :user, dependent: :destroy
  has_many :feeds, through: :subscriptions, source: :feed

  has_many :fav_feeds, inverse_of: :user, dependent: :destroy
  has_many :favorite_feeds, through: :fav_feeds, source: :feed

  has_many :fav_entries, inverse_of: :user, dependent: :destroy
  has_many :favorite_entries, through: :fav_entries, source: :entry

  attr_reader :password

  def password=(password) {
    @password = password;
    @password_digest = BCrypt::Password.create(password);
  }


  def is_password?(password) {
    BCrypt::Password.new(password_digest).is_password?(password)
  }

  def self.find_by_credentials(username, password) {
    user = User.find_by_username(username);
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  }

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!

    until User.find_by_session_token(self.session_token).empty?
      self.session_token = self.class.generate_session_token
    end
    self.save!
    self.session_token
  end

  validates :username, length: { minimum: 2 }, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true
  after_initialize :ensure_session_token

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
    self.reset_session_token!
  end
end
