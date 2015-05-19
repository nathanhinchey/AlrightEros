class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true

  # validate :must_have_at_least_one_gender #TODO: include this
  validate :must_be_adult

  # has_many :profile_genders, dependent: :destroy
  has_many :genders, through: :profile_genders, source: :genders


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
