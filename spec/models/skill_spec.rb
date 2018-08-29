require 'rails_helper'

RSpec.describe Skill, type: :model do
  it "has a valid factory" do
    expect(build(:skill).valid?).to be true
  end
  it "has a invalid factory" do
    expect(build(:invalid_skill).valid?).to be false
  end
  describe "Associations" do
    it {should have_many(:seeker_skills)}
  end
end
