class AddPhotoToSeekerProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :seeker_profiles, :photo, :string
  end
end
