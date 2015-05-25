class AcceptableAnswer < ActiveRecord::Base
  validates :user_answer, presence: true
  validates :answer_id, presence: true

  belongs_to :user_answer,inverse_of: :acceptable_answers
end
