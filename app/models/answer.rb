class Answer < ActiveRecord::Base
  validates :question, presence: true
  validates :answer_text, presence: true

  belongs_to :question, inverse_of: :answers

  has_many :user_answers, dependent: :destroy
end
