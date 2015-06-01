class Motivation < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true
  has_many :profiles
end
