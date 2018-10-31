require 'rails_helper'

RSpec.describe JobPost, type: :model do
  it "has a valid factory" do
    expect(build(:job_post).valid?).to be true
  end

  describe "Associations" do
    it {should belong_to(:recuitor)}
    it {should  have_many(:job_educations).dependent(:destroy)}
    it {should have_many(:educations)}
    it {should accept_nested_attributes_for(:job_educations)}

    it {should  have_many(:job_categories).dependent(:destroy)}
    it {should have_many(:categories)}
    it {should accept_nested_attributes_for(:job_categories)}

    it {should have_many(:apply_jobs)}

    it {should  have_many(:job_skills).dependent(:destroy)}
    it {should have_many(:skills)}
    it {should accept_nested_attributes_for(:job_skills)}
  end
end
