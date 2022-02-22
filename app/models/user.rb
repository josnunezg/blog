class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
