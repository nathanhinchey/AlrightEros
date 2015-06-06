class UserAnswer < ActiveRecord::Base
  validates :answer_id, presence: true
  validates :profile_id, presence: true
  validate :profile_has_not_answered_this_question_before

  belongs_to :profile
  belongs_to :answer
  has_one :question, through: :answer, source: :question
  has_many :acceptable_answers,
    dependent: :destroy,
    inverse_of: :user_answer

  private
    def profile_has_not_answered_this_question_before
      if profile.question_ids.include? self.answer.question_id
        errors.add(:user, "cannot answer question twice")
      end
    end
end
