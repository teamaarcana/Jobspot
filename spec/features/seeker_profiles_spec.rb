require 'rails_helper'

RSpec.feature "SeekerProfiles", type: :feature do
  context "create seeker profile" do
    let(:seeker) {create(:seeker)}
    before (:each) do
      seeker
    end

    it "with valid attribure " do
      login_as(seeker, :scope => :seeker)
      education = create(:education)
      skill = create(:skill)
      category = create(:category)
      login_as(seeker, :scope => :seeker)
      visit '/seeker_profiles/new'
      expect(page).to have_content("New Seeker Profile")
      fill_in "First name", :with => "Ranjan"
      fill_in "Last name", :with =>"Bajracharya"
      fill_in "Phone no", :with => "122222222"
      find(:css, "#seeker_profile_sex_true[value='true']").set(true)
      click_button("Add Education")
      find(:css, "#seeker_profile_seeker_educations_attributes_1_education_id").select('Bachelor')
      find(:css, "#seeker_profile_seeker_educations_attributes_1_colzname").set("New College")
      find(:css, "#seeker_profile_seeker_educations_attributes_1_year").set("2004")
      select('Programming', :from=>'seeker_profile_seeker_categories_attributes_0_category_id')
      click_button("Add Skills")
      find(:css, "#seeker_profile_seeker_skills_attributes_2_skill_id").select('IT & Telecommunication')
      fill_in "DoB(dd/mm/yyyy)", :with =>"01/01/1999"
      fill_in "Nationality", :with => "Nepali"
      attach_file("seeker_profile[photo]", Rails.root + "spec/1.jpg")
      attach_file("seeker_profile[attachment]", Rails.root + "spec/1.pdf")
      click_button("Update")
      expect(page).to have_content("Seeker profile was successfully created.")
    end
  end
end
