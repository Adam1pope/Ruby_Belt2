class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites, dependent: :destroy
  has_many :songs, through: :favorites

  validates :first_name, :last_name, :email, presence: true
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
