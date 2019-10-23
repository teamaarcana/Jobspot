class SeekerEducation < ApplicationRecord
  belongs_to :seeker_profile, optional: true
  belongs_to :education
end
