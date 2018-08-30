require 'rails_helper'

RSpec.feature "Homepages", type: :feature do
  context "when user not logged in " do
    before (:each) do
      visit "/"
    end
    it "show the content" do
      expect(page).to have_content("Easiest Step Towards Your New Job")
      expect(page).to have_content(/Search/i)
      expect(page).to have_content(/Latest Jobs/i)
      click_link("Home")
      click_link("Companies")
      click_link("Job Details")
      click_link("Sign In")
      click_link("Register")
    end
    it "unsucessful to apply for job", js: true do
      job = create(:job_post)
      job1 = create(:job_post)
      visit "/"
      expect(page).to have_content(/Apply Now/i, exact: 2)
      first('.button').click_button('Apply Now')
      expect(accept_alert).to have_content('Do you want to apply for this job')
      expect(page).to have_content(/Seeker's LogIn/i)
    end
  end

  context "when seeker logged in" do
    let(:seeker){create(:seeker)}
    before (:each) do
      seeker
      visit "/"
    end

    it "shows content " do
      login_as(seeker, :scope => :seeker)
      expect(page).to have_content("Easiest Step Towards Your New Job")
      expect(page).to have_content(/Search/i)
      expect(page).to have_content(/Latest Jobs/i)
      click_link("Home")
      click_link("Companies")
      click_link("Applied Jobs")
      find(:css, 'div.dropdown').click
      expect(page).to have_content(/Profile/i)
      expect(page).to have_content(/Edit Profile/i)
      expect(page).to have_content(/Change Password/i)
      expect(page).to have_content(/Logout/i)
    end

    it "sucessfully apply for job" do
      job = create(:job_post)
      job1 = create(:job_post)
      visit "/"
      expect(page).to have_content(/Apply Now/i, exact: 2)
      first('.button').click_button('Apply Now')
      expect(accept_alert).to have_content('Do you want to apply for this job')
    end
  end

  context "when recuitor logged in" do
    let(:recuitor){create(:recuitor)}
    before (:each) do
      recuitor
      login_as(recuitor, :scope => :recuitor)
      visit "/"
    end

    it "shows content " do
      expect(page).to have_content("Easiest Step Towards Your New Job")
      expect(page).to have_content(/Search/i)
      expect(page).to have_content(/Latest Jobs/i)
      click_link("Home")
      click_link("Companies")
      click_link("Posted Jobs")
      find(:css, 'div.dropdown').click
      expect(page).to have_content(/Profile/i)
      expect(page).to have_content(/Edit Profile/i)
      expect(page).to have_content(/Change Password/i)
      expect(page).to have_content(/Logout/i)
    end

    it "cannot apply for job" do
      job = create(:job_post)
      job1 = create(:job_post)
      visit "/"
      expect(page).not_to have_content(/Apply Now/i)
    end

    it "job can be post",js: true do
      education = create(:education)
      skill = create(:skill)
      category = create(:category)
      click_link("Post Job")
      fill_in "Job Title", :with => "Ranjan"
      fill_in "No. of Vacancies", :with=> 3
      fill_in "Experience (years)", :with => "3 yrs"
      click_button("Add Education")
    

      select('Programming', :from=>'job_post_job_categories_attributes_0_category_id')
      fill_in "Deadline", :with => "20 Aug 2018"
      fill_in "Job Type (FT/PT/Contract)", :with=> "Contract"
      click_button("Update")
    end
  end
end
