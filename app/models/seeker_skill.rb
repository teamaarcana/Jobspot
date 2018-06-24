class SeekerSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :seeker_category, optional: true
end
