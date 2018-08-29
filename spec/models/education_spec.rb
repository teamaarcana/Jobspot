require 'rails_helper'

RSpec.describe Education, type: :model do
  it "has a valid factory" do
    expect(build(:education).valid?).to be true
  end
  it "has a invalid factory" do
    expect(build(:invalid_education).valid?).to be false
  end
  describe "Associations" do
    it {should have_many(:seeker_educations)}
  end
end
