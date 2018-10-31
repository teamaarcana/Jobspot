require 'rails_helper'

RSpec.describe JobSkill, type: :model do
  describe "Associations" do
    it {should belong_to(:skill)}
    it {should belong_to(:job_post)}
  end
end
