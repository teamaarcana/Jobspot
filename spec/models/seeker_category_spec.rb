require 'rails_helper'

RSpec.describe SeekerCategory, type: :model do
  describe "Associations" do
    it {should belong_to(:seeker_profile)}
    it {should belong_to (:category)}
  end
end
