require 'rails_helper'

RSpec.describe Education, type: :model do
  describe "Associations" do
    it {should have_many(:seeker_educations)}
  end
end
