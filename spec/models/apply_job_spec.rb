require 'rails_helper'

RSpec.describe ApplyJob, type: :model do
  describe "Associations" do
    it { should belong_to(:job_post) }
    it { should belong_to(:seeker) }
  end
end
