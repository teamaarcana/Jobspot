require 'rails_helper'

RSpec.describe SeekerProfile, type: :model do
  it "has a valid factory" do
    expect(build(:seeker_profile).valid?).to be true
  end
  it "has a invalid factory" do
    expect(build(:invalid_seeker_profile).valid?).to be false
  end

  describe "Associations" do
    it {should belong_to(:seeker)}
  end

  describe "Validation" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone_no) }
    it { should validate_presence_of(:sex) }
    it { should validate_presence_of(:nationality) }
    it { should validate_presence_of(:dob) }
  end

  describe ".recommendations" do
    let(:jobs){
      [["Bachelor", "Administration", "ASP.net", 5],
       ["Diploma ", "Administration", "Writing", 7],
       ["Bachelor", "Administration", "Strategic thinking", 12],
       ["Intermediate", "Administration", "Strategic Planning", 37],
       ["Bachelor", "Administration", "Troubleshooting", 40],
       ["Intermediate", "Administration", "Teamwork", 52],
       ["Diploma ", "Administration", "ASP.net", 59],
       ["SLC ", "Administration", "Communication", 61],
       ["Bachelor", "Administration", "Reading", 82],
       ["Diploma ", "Administration", "Accountability", 88]]

    }
    let(:invalid_jobs){
      []
    }
    let(:invalid_seeker_skills){
      []
    }
    let(:seeker_skills){
      ["SLC ", "Intermediate", "Bachelor", "Administration", "Teamwork", "ASP.net", "Ruby On Rails"]
    }

    let(:category){ create(:category, name: "Administration")}
    let(:category1){ create(:category, name: "Banking")}
    let(:skill){ create(:skill, name: "Accountability")}
    let(:education3){ create(:education, eduName: "Ph.D.")}
    let(:education2){ create(:education, eduName: "Master")}
    let(:education1) {create(:education)}
    let(:education){ create(:education, eduName: "SLC")}
    let(:seeker_profile) { create(:seeker_profile)}
    let(:seeker_profile1) { create(:seeker_profile)}
    let(:seeker_profile2) { create(:seeker_profile)}
    let(:job_post) {create(:job_post)}
    let(:job_post1) {create(:job_post)}
    let(:job_post2) {create(:job_post)}
    let(:job_post3) {create(:job_post)}

    it "returns recommended jobs " do
      expect(subject.recommendations(jobs,seeker_skills).sort_by { |job| 1 - job.jaccard_index }).to eq [
        ["Bachelor", "Administration", "ASP.net", 5],
       ["Intermediate", "Administration", "Teamwork", 52],
       ["Bachelor", "Administration", "Strategic thinking", 12],
       ["Intermediate", "Administration", "Strategic Planning", 37],
       ["Bachelor", "Administration", "Troubleshooting", 40],
       ["Diploma ", "Administration", "ASP.net", 59],
       ["SLC ", "Administration", "Communication", 61],
       ["Bachelor", "Administration", "Reading", 82],
       ["Diploma ", "Administration", "Writing", 7],
       ["Diploma ", "Administration", "Accountability", 88]
      ]
    end
    describe "invalid condition" do
      it "invalid jobs" do
        expect(subject.recommendations(invalid_jobs,seeker_skills).sort_by { |job| 1 - job.jaccard_index }).to be_empty
      end
      it "invalid seeker skills" do
        expect(subject.recommendations(jobs,invalid_seeker_skills).sort_by { |job| 1 - job.jaccard_index }).to be_empty
      end
    end
    describe 'recommended_jobs' do
      subject(:seeker) { seeker_profile }
      subject(:seeker1) { seeker_profile1 }
      subject(:seeker2) { seeker_profile2 }
      subject(:job) {job_post}
      subject(:job1) {job_post1}
      subject(:job2) {job_post2}
      subject(:job3) {job_post3}
      dummy = Array.new
      before do
        job.skills << skill
        job.educations << education
        job.categories << category

        job1.skills << skill
        job1.educations << education1
        job1.categories << category


        job2.skills << skill
        job2.educations << education2
        job2.categories << category

        job3.skills << skill
        job3.educations << education3
        job3.categories << category

        seeker.skills << skill
        seeker.educations << education1
        seeker.categories << category

        seeker1.skills << skill
        seeker1.educations << education3
        seeker1.categories << category

        seeker2.skills << skill
        seeker2.educations << education
        seeker2.categories << category
      end
      context 'recommended_jobs' do

        it "mid id education" do
          # expect(2).to be >= 1
          # expect(seeker.categories).to eq(job.categories)
          # dummy << job.skills
          # dummy << job.educations
          # dummy << job.categories
          # dummy << job.id
          # dummy.should include (1
          expect(seeker.recommended_jobs). to eq [
            ["Bachelor", "Administration", "Accountability", job1.id],
            ["SLC", "Administration", "Accountability", job.id]
          ]
        end

         it "lowest id education" do
           expect(seeker2.recommended_jobs).to eq []
         end

         it "highest id education" do
           expect(seeker1.recommended_jobs).to eq [
             ["Ph.D.", "Administration", "Accountability", job3.id],
             ["SLC", "Administration", "Accountability", job.id],
             ["Bachelor", "Administration", "Accountability", job1.id],
             ["Master", "Administration", "Accountability", job2.id]
           ]
         end
      end
    end
  end
end
1
