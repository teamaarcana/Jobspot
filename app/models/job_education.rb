class JobEducation < ApplicationRecord
  belongs_to :job_post, optional: true
  belongs_to :education
end
