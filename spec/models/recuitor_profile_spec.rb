require 'rails_helper'

RSpec.describe RecuitorProfile, type: :model do
  it "has a valid factory" do
    expect(build(:recuitor_profile).valid?).to be true
  end
  describe "Associations" do
    it {should belong_to(:recuitor)}
  end
  describe "Validation" do
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:contact_no) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:pan_no) }
  end
end
