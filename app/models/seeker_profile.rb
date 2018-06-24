class SeekerProfile < ApplicationRecord
  belongs_to :seeker
  has_many :seeker_educations, dependent: :destroy
  has_many :educations, :through => :seeker_educations
  accepts_nested_attributes_for :seeker_educations
end
