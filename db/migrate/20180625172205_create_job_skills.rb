class CreateJobSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :job_skills do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :job_category, index: true
      t.timestamps
    end
  end
end
