class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  has_many :journals
  has_many :entries, through: :journals
end