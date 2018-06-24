class SeekerCategory < ApplicationRecord
  belongs_to :seeker_profile, optional: true
  belongs_to :category
end
