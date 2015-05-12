class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  #TODO: validate :valid_email_regex
  validates :password_digest, presence: true
  #TODO: validate :unique_username

  attr_reader :password

  has_many :session_tokens

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
