require 'rails_helper'

RSpec.describe SeekerProfile, type: :model do
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

end
