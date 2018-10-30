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

  describe "#recommendations" do
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
    context "invalid condition" do
      it "invalid jobs" do
        expect(subject.recommendations(invalid_jobs,seeker_skills).sort_by { |job| 1 - job.jaccard_index }).to be_empty
      end
      it "invalid seeker skills" do
        expect(subject.recommendations(jobs,invalid_seeker_skills)
          .sort_by { |job| 1 - job.jaccard_index }).to be_empty
      end
    end
  end
  describe '#recommended_jobs' do
    let(:category){ create(:category, name: "Administration")}
    let(:category1){ create(:category, name: "Banking")}
    let(:skill){ create(:skill, name: "Accountability")}
    let(:education3){ create(:education, eduName: "Ph.D.")}
    let(:education2){ create(:education, eduName: "Master")}
    let(:education1) {create(:education)}
    let(:education){ create(:education, eduName: "SLC")}
    let(:seeker_profile) { create(:seeker_profile,skills: [skill], educations: [education1],categories: [category] )}
    let(:seeker_profile1) { create(:seeker_profile,skills: [skill], educations: [education3],categories: [category])}
    let(:seeker_profile2) { create(:seeker_profile,skills: [skill], educations: [education],categories: [category])}
    let(:job_post) {create(:job_post, skills: [skill], educations: [education],categories: [category])}
    let(:job_post1) {create(:job_post, skills: [skill], educations: [education1],categories: [category])}
    let(:job_post2) {create(:job_post, skills: [skill], educations: [education2],categories: [category])}
    let(:job_post3) {create(:job_post, skills: [skill], educations: [education3],categories: [category])}


    before do
      job_post
      job_post1
      job_post2
      job_post3
      seeker_profile
      seeker_profile1
      seeker_profile2
    end
    context 'recommended_jobs' do
     context 'with mid education id ' do
        it "gives correct reult" do
          jobs = [
            ["Bachelor", "Administration", "Accountability", job_post1.id],
            ["SLC", "Administration", "Accountability", job_post.id]
          ]
          expect(seeker_profile.recommended_jobs). to eq (jobs)
        end
      end

     context 'with lowest education id '
       it "gives last job" do
         job = [["SLC", "Administration", "Accountability",job_post.id ]]
         expect(seeker_profile2.recommended_jobs).to eq (job)
       end
     end

     context 'with highest education id' do
       it "gives all jobs" do
         jobs = [
           ["Ph.D.", "Administration", "Accountability", job_post3.id],
           ["SLC", "Administration", "Accountability", job_post.id],
           ["Bachelor", "Administration", "Accountability", job_post1.id],
           ["Master", "Administration", "Accountability", job_post2.id]
         ]
         expect(seeker_profile1.recommended_jobs).to eq (jobs)
       end
     end
  end
end
