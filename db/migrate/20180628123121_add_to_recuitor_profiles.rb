class AddToRecuitorProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :recuitor_profiles, :industry, :string
    add_column :recuitor_profiles, :website, :string
    add_column :recuitor_profiles, :email, :string

  end
end
