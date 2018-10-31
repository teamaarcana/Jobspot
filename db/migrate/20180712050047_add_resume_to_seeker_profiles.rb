class AddResumeToSeekerProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :seeker_profiles, :attachment, :string
  end
end
