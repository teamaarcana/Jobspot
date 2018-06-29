class JobPost < ApplicationRecord
  belongs_to :recuitor

  has_many :job_educations, dependent: :destroy
  has_many :educations, :through => :job_educations
  accepts_nested_attributes_for :job_educations


  has_one :job_category, dependent: :destroy
  has_one :category, :through => :job_category
  accepts_nested_attributes_for :job_category

  has_many :apply_jobs
end
