class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  validates :motivation, presence: true

  validate :must_be_adult

  belongs_to :motivation


  has_attached_file :picture,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "Eris_Antikensammlung_Berlin_F1775.jpg"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def age
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years
    #for days before birthday
    age
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
      yours.user_id = you.id
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
        theirs.user_id = them.id
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
      you.id = ? AND them.id = ?
    SQL

    results = ComplexQuery.query_by_sql(common_questions, [self.id, other_user.id])
    common_answers = 0.0
    results.each do |hash|
      common_answers += 100 if hash['their_answers'] == hash['your_answers']
    end

    common_answers / results.count
  end

  private
    def must_have_at_least_one_gender
      if genders.length < 1
        errors.add(:gender, "must select at least one gender")
      end
    end

    def must_be_adult
      if birthday.class != Date
        errors.add(:birthday, "must be specified")
      elsif age < 18
        errors.add(:age, "must be 18 or over")
      end
    end
end

# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "Stmt1420751757000",
#       "Effect": "Allow",
#       "Action": [
#         "s3:*"
#       ],
#       "Resource": [
#         "arn:aws:s3:::alrighteros-dev",
#         "arn:aws:s3:::alrighteros-dev/*",
#         "arn:aws:s3:::alrighteros-pro",
#         "arn:aws:s3:::alrighteros-pro/*"
#       ]
#     }
#   ]
# }
