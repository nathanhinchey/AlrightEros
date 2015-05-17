class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  #TODO: validate :valid_email_regex
  validates :password_digest, presence: true
  #TODO: validate :unique_username


  attr_reader :password


  has_many :sessions,
    dependent: :destroy

  has_one :profile

  has_many :user_answers, dependent: :destroy


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
