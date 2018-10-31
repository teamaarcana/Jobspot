require 'rails_helper'

RSpec.describe Seeker, type: :model do
  it "has a valid factory" do
    expect(build(:seeker).valid?).to be true
  end
  it "has a invalid factory" do
    expect(build(:invalid_seeker).valid?).to be false
  end
  describe "Associations" do
    it {should have_one(:seeker_profile)}
    it {should have_many(:apply_jobs)}
  end
end
