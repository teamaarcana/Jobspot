class JobPost < ApplicationRecord
  belongs_to :recuitor

  has_many :job_educations, dependent: :destroy
  has_many :educations, :through => :job_educations
  accepts_nested_attributes_for :job_educations


  has_many :job_categories, dependent: :destroy
  has_many :categories, :through => :job_categories
  accepts_nested_attributes_for :job_categories

  has_many :apply_jobs

  has_many :job_skills, dependent: :destroy
  has_many :skills, :through => :job_skills
  accepts_nested_attributes_for :job_skills
end
