require 'rails_helper'

RSpec.describe JobEducation, type: :model do
  describe "Associations" do
    it {should belong_to(:job_post)}
    it {should belong_to(:education)}
  end
end
