class AddPhotoToRecuitorProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :recuitor_profiles, :photo, :string
  end
end
