class AddLocationToJobPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :job_posts, :location, :string

  end
end
