class JobCategory < ApplicationRecord
  belongs_to :job_post, optional: true
  belongs_to :category
  has_many :job_skills
  has_many :skills, :through => :job_skills
  accepts_nested_attributes_for :job_skills
end
