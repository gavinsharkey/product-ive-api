class User < ApplicationRecord
  has_secure_password

  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is valid' } 
end
