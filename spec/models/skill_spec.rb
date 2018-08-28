require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe "Associations" do
    it {should have_many(:seeker_skills)}
  end
end
