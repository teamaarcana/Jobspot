class CreateSeekerEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :seeker_educations do |t|
      t.belongs_to :education, index: true
      t.belongs_to :seeker, index: true
      t.string :colzname
      t.string :year
      t.timestamps
    end
  end
end
