class Session < ActiveRecord::Base
  validates :user_id, presence: true
  validates :session_token, presence: true, uniqueness: true

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
