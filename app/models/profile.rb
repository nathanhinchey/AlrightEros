class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true

  # validate :must_have_at_least_one_gender #TODO: include this
  validate :must_be_adult

  has_many :profile_genders, dependent: :destroy
  has_many :genders, through: :profile_genders, source: :genders

  def age
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years
    #for days before birthday
    age.years
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
      elsif age < 18.years
        errors.add(:age, "must be 18 or over")
      end
    end
end
