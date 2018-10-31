class CreateJobCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :job_categories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :job_post, index: true
      t.timestamps
    end
  end
end
