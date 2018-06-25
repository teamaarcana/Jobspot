class CreateJobPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :job_posts do |t|
      t.string :job_title
      t.string :no_of_vacancies
      t.string :experience
      t.string :description
      t.string :department
      t.string :deadline
      t.string :job_type
      t.belongs_to :recuitor, index: true
      t.timestamps
    end
  end
end
