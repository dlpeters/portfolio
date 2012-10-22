class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation

  attr_accessor :password

  before_save :encrypt_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, on: :create

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def password_encrypt(password, salt)
    BCrypt::Engine.hash_secret(password, password_salt)
  end

end
