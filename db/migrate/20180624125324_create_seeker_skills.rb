class CreateSeekerSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :seeker_skills do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :seeker_category, index: true
      t.timestamps
    end
  end
end
