class SeekerCategory < ApplicationRecord
  belongs_to :seeker_profile, optional: true
  belongs_to :category
  has_many :seeker_skills
  has_many :skills, :through => :seeker_skills
  accepts_nested_attributes_for :seeker_skills
end
