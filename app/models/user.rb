class User < ApplicationRecord
  has_many :posts
  has_secure_password

  validates :name, presence: true, length: {minimum: 3}
  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true
end
