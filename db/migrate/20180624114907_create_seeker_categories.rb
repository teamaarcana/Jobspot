class CreateSeekerCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :seeker_categories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :seeker_profile, index: true
      t.timestamps
    end
  end
end
