class ApplyJob < ApplicationRecord
  belongs_to :job_post
  belongs_to :seeker
end
