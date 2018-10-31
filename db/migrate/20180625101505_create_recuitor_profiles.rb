class CreateRecuitorProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :recuitor_profiles do |t|
      t.string :company_name
      t.string :contact_no
      t.string :address
      t.string :pan_no
      t.string :description
      t.belongs_to :recuitor, index: true
      t.timestamps
    end
  end
end
