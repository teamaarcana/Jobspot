require 'rails_helper'

RSpec.describe SeekerSkill, type: :model do
  describe "Associations" do
    it {should belong_to(:seeker_profile)}
    it {should belong_to(:skill)}
  end
end
