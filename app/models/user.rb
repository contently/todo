require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true

  after_initialize :ensure_session_token!

  attr_reader :password

  has_many :tasks

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user
    user.is_password?(password) ? user: nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = new_session_token
    save!
    self.session_token
  end

  def new_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  private

  def ensure_session_token!
    new_session_token unless self.new_session_token
  end
end
