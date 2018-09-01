class Skill < ApplicationRecord
  has_many :seeker_skills
  validates_presence_of :name
end
