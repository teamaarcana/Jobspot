require 'rails_helper'

RSpec.feature "RecuitorProfiles", type: :feature do
  context "create recuitor profile" do
    let(:recuitor) {create(:recuitor)}
    before (:each) do
      recuitor
    end

    it "with valid attribure" do
      login_as(recuitor, :scope => :recuitor)
      visit "/recuitor_profiles/new"
      fill_in "Company name", :with => "ABC"
      fill_in "Contact no", :with => "9876543210"
      fill_in "Address", :with => "NY"
      fill_in "Pan no", :with => "AO12345"
      fill_in "Industry", :with => "IT Company"
      fill_in "Website", :with => "www.abc.com"
      fill_in "Email", :with => "info@abc.com"

    end
  end
end
