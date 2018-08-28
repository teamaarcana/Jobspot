require 'rails_helper'

RSpec.describe Recuitor, type: :model do
  describe "Associations" do
    it {should have_one (:recuitor_profile)}
    it {should have_many(:job_posts)}
  end
end
