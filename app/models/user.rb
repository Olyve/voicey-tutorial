# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  token         :string
#  password_hash :string
#  password_salt :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_token  (token)
#

class User < ApplicationRecord
  has_many :memos
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  attribute :password, :string
  attribute :password_hash, :string
  before_save :encrypt_password
  before_create :generate_token

  # Checks if a user is autenticated
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end

  # Salts and hashes a user's password
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # Generates a token for the user
  def generate_token
    token_gen = SecureRandom.hex
    self.token = token_gen
    return token_gen
  end
end
