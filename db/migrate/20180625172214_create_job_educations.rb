class CreateJobEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :job_educations do |t|
      t.belongs_to :education, index: true
      t.belongs_to :job_post, index: true
      t.timestamps
    end
  end
end
