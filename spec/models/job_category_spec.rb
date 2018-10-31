require 'rails_helper'

RSpec.describe JobCategory, type: :model do
  describe "Associations" do
    it {should belong_to(:job_post)}
    it { should belong_to(:category)}
  end
end
