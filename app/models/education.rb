class Education < ApplicationRecord
  has_many :seeker_educations
  validates_presence_of :eduName
end
