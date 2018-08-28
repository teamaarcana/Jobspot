require 'rails_helper'

RSpec.describe Seeker, type: :model do
  describe "Associations" do
    it {should have_one(:seeker_profile)}
    it {should have_many(:apply_jobs)}
  end
end
