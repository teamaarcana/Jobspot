class JobCategory < ApplicationRecord
  belongs_to :job_post, optional: true
  belongs_to :category
end
