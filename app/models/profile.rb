class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :birthday, presence: true

  validate :must_have_at_least_one_gender
  validate :must_be_adult

  has_many :profile_genders, dependent: :destroy
  has_many :genders, through: :profile_genders, source: :genders

  private
    def must_have_at_least_one_gender
      if genders.length < 1
        errors.add(:gender, "must select at least one gender")
      end
    end

    def must_be_adult
      if birthday - Date.today < 18
        errors.add(:age, "must be 18 or over")
      end
    end
end
