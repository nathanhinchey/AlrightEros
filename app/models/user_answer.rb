class UserAnswer < ActiveRecord::Base
  validates :answer_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :answer
  has_one :question, through: :answer, source: :question
end
