require 'rails_helper'

RSpec.feature "Mainpages", type: :feature do
  feature "seeker login" do
    let(:user){FactoryBot.create(:seeker, :email => "user@example.com", :password => "secret")}
    before (:each) do
      user
      visit "/seekers/sign_in"
      fill_in "Email", :with => "user@example.com"
    end
    scenario "successful " do
      fill_in "Password", :with => "secret"
      click_button "Sign In"
      expect(page).to have_css("div.dropdown")
    end
    scenario "unsucessful" do
      fill_in "Password", :with => "aaaaaaa"
      click_button "Sign In"
      expect(page).to have_css("p.alert")
      expect(page).to have_content("Invalid Email or password.")
    end
  end

  feature "recruiter login" do
    let(:user){FactoryBot.create(:recuitor, :email => "user@example.com", :password => "secret")}
    before (:each) do
      user
      visit "/recuitors/sign_in"
      fill_in "Email", :with => "user@example.com"
    end
    scenario "successful " do
      fill_in "Password", :with => "secret"
      click_button "Sign In"
      expect(page).to have_css("div.dropdown")
      expect(page).to have_content(/Post Job/i)

    end
    scenario "unsucessful" do
      fill_in "Password", :with => "aaaaaaa"
      click_button "Sign In"
      expect(page).to have_css("p.alert")
      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
