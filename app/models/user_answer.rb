class UserAnswer < ActiveRecord::Base
  validates :answer_id, presence: true
  validates :user_id, presence: true
  validate :user_has_not_answered_this_question_before

  belongs_to :user
  belongs_to :answer
  has_one :question, through: :answer, source: :question
  has_many :acceptable_answers,
    dependent: :destroy,
    inverse_of: :user_answer

  private
    def user_has_not_answered_this_question_before
      if user.question_ids.include? self.answer.question_id
        errors.add(:user, "cannot answer question twice")
      end
    end
end
