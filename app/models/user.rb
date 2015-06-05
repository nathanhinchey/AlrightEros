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

  def match_percentage(other_user)
    common_questions = <<-SQL
    --gets all the questions in common
    SELECT
      yours.answer_id as your_answers, theirs.answer_id as their_answers
    FROM
      --Your questions & answers
      profiles as you
      JOIN
      user_answers as yours
      ON
      yours.user_id = you.user_id
      JOIN
      answers as your_answers
      ON
      yours.answer_id = your_answers.id
      JOIN
      questions as your_questions
      ON
      your_questions.id = your_answers.question_id
      JOIN
        --Their questions & answers
        profiles as them
        JOIN
        user_answers as theirs
        ON
        theirs.user_id = them.user_id
        JOIN
        answers as their_answers
        ON
        theirs.answer_id = their_answers.id
        JOIN
        questions as their_questions
        ON
        their_questions.id = their_answers.question_id
      ON
        their_questions.id = your_questions.id
    WHERE
      you.id = ? AND them.id = ?;
    SQL

    results = ComplexQuery.query_by_sql(common_questions, [self.id, other_user.id])
    common_answers = 0
    results.each do |hash|
      common_answers += 100 if hash['their_answers'] == hash['your_answers']
    end
    return 0 if results.count == 0
    common_answers / results.count
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
