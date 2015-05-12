class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  #TODO: validate email by regex
  validates :password_digest, presence: true

  has_many :session_tokens
end
