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
  describe '#fuzzy_search' do
    let(:job){create :job_post}
    let(:job1){create :job_post, job_title: "Internal Marketing"}
    before(:each) do
      job
      job1
    end
    it 'gives required result' do
      query = 'internal'
      expect(JobPost.fuzzy_search(query)).to eq ([job1])
    end
    it 'gives required empty result' do
      query = 'xyz '
      expect(JobPost.fuzzy_search(query)).to eq ([])
    end
  end
end
