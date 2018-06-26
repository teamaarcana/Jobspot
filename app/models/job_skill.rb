class RecuitorSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :job_category, optional: true
end
