class SeekerProfile < ApplicationRecord
  belongs_to :seeker
  has_many :seeker_educations, dependent: :destroy
  has_many :educations, :through => :seeker_educations
  accepts_nested_attributes_for :seeker_educations


  has_one :seeker_category, dependent: :destroy
  has_one :category, :through => :seeker_category
  accepts_nested_attributes_for :seeker_category
end
