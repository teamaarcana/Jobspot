class SeekerProfile < ApplicationRecord
  belongs_to :seeker, dependent: :destroy
  has_many :seeker_educations, dependent: :destroy
  has_many :educations, :through => :seeker_educations
  accepts_nested_attributes_for :seeker_educations


  has_many :seeker_categories, dependent: :destroy
  has_many :categories, :through => :seeker_categories
  accepts_nested_attributes_for :seeker_categories

  has_many :seeker_skills, dependent: :destroy
  has_many :skills, :through => :seeker_skills
  accepts_nested_attributes_for :seeker_skills

  mount_uploader :photo, PhotoUploader
  mount_uploader :attachment, AttachmentUploader

  validates_presence_of :first_name,:last_name,:phone_no,
                        :sex, :dob, :nationality

  def recommended_jobs
    seeker_education =  educations.pluck(:eduName)
    seeker_categories = categories.pluck(:name)
    seeker_skills =  skills.pluck(:name)
    job = seeker_education + seeker_categories + seeker_skills
    this_jobs = Array.new
    JobPost.all.each do |job|
      education =  job.educations.pluck(:eduName)
      categories = job.categories.pluck(:name)
      if educations.maximum(:id) >= job.educations.maximum(:id)
        if seeker_categories == categories
          skills =  job.skills.pluck(:name)
          id = job.id
          this =  education + categories + skills
          this.push(id)
          this_jobs.push(this)
        end
      end
    end
    recommendations(this_jobs,job).sort_by { |job| 1 - job.jaccard_index }
  end

  # recommendations algorithm
  def recommendations(this_jobs,job)
    if job.empty?
      this_jobs = []
    end
    this_jobs.map! do |this_job|
     this_job.define_singleton_method(:jaccard_index) do @jaccard_index;  end

     this_job.define_singleton_method("jaccard_index=") do |index|
       @jaccard_index = index || 0.0
     end

     intersection = (job & this_job).size
     union = (job | this_job).size

     this_job.jaccard_index = (intersection.to_f / union.to_f) rescue 0.0
     this_job
    end
  end

end
