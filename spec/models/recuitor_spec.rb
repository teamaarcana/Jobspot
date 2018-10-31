require 'rails_helper'

RSpec.describe Recuitor, type: :model do
  it "has a valid factory" do
    expect(build(:recuitor).valid?).to be true
  end
  describe "Associations" do
    it {should have_one (:recuitor_profile)}
    it {should have_many(:job_posts)}
  end
end
