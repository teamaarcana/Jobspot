class CreateApplyJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :apply_jobs do |t|
      t.belongs_to :job_post, index: true
      t.belongs_to :seeker, index: true

      t.timestamps
    end
  end
end
