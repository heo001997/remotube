class User < ApplicationRecord
  TEST_DEFAULT_PASSWORD = "123".freeze

  attr_accessor :password

  before_save :encrypt_password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :videos

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)

    nil
  end

  def grant_user_access
    update!(access_token: generate_token)
  end

  def revoke_user_access
    update!(access_token: nil)
  end

  def encrypt_password
    return if password.blank?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  private

  def generate_token
    "Bearer #{SecureRandom.base64(32).tr('+/=', '0aZ').strip.delete("\n")}"
  end
end
