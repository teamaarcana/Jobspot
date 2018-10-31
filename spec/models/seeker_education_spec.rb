require 'rails_helper'

RSpec.describe SeekerEducation, type: :model do
  describe "Associations" do
    it {should belong_to(:seeker_profile)}
    it {should belong_to (:education)}
  end
end
