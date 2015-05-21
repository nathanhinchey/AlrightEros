class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  #TODO: validate :valid_email_regex
  validates :password_digest, presence: true
  #TODO: validate :unique_username


  attr_reader :password


  has_many :sessions,
    dependent: :destroy

  has_one :profile

  has_many :sent_messages,
    class_name: 'Message',
    foreign_key: :sender_id

  has_many :received_messages,
    class_name: 'Message',
    foreign_key: :receiver_id

  has_many :user_answers, dependent: :destroy
  has_many :answers, through: :user_answers, source: :answer
  has_many :questions, through: :user_answers, source: :question


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def messages
    Message.where("sender_id = ? OR receiver_id = ?", self.id, self.id)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
