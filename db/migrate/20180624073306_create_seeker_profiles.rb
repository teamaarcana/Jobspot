class CreateSeekerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :seeker_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.string :sex
      t.string :prefered_loc
      t.integer :salary
      t.string :dob
      t.string :nationality
      t.string :perm_address
      t.string :temp_address
      t.float :experience
      t.string :description
      t.string :location
      t.string :experience
      t.boolean :job_status
      t.string :certificate
      t.belongs_to :seeker, index: true
      t.timestamps
    end
  end
end
