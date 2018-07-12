class SeekerSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :seeker_profile, optional: true
end
