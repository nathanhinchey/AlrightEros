class Question < ActiveRecord::Base
  validates :question_body,
    presence: true,
    uniqueness: true,
    length: { minimum: 12 }

  validate :two_to_four_answers

  has_many :answers, inverse_of: :question

  private
    def two_to_four_answers
      errors.add(:answers, "too few") if answers.size < 2
      errors.add(:answers, "too many") if answers.size > 4
    end
end
