require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(build(:category).valid?).to be true
  end
  it "has a invalid factory" do
    expect(build(:invalid_category).valid?).to be false
  end
  describe "Associations" do
    it { should have_many(:seeker_categories) }
  end
end
