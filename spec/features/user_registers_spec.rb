require 'rails_helper'

RSpec.feature "UserRegisters", type: :feature do
  feature "register user" do

    feature "as seeker " do
      scenario "with valid attribute" do
        visit '/seekers/sign_up'
        fill_in ("Email"), :with=>"user@example.com"
        fill_in ("Password"), :with=>"aaaaaa"
        fill_in ("Confirm Password"), :with =>"aaaaaa"
        click_button ("Sign up")
        expect(page).to have_text(/New Seeker Profile/i)
      end
      scenario "with invalid attribute" do
        visit '/seekers/sign_up'
        fill_in ("Email"), :with=>"user@example.com"
        fill_in ("Password"), :with=>"aaa"
        fill_in ("Confirm Password"), :with =>"aaa"
        click_button ("Sign up")
        expect(page).to have_text(/Seeker's SignUp/i)
      end
    end

    feature "as recuiter " do
      scenario "with valid attribute" do
        visit '/recuitors/sign_up'
        fill_in ("Email"), :with=>"user@example.com"
        fill_in ("Password"), :with=>"aaaaaa"
        fill_in ("Confirm Password"), :with =>"aaaaaa"
        click_button ("Sign up")
        expect(page).to have_text(/Welcome! You have signed up successfully./i)
      end
      scenario "with valid attribute" do
        visit '/recuitors/sign_up'
        fill_in ("Email"), :with=>"user@example.com"
        fill_in ("Password"), :with=>"aaaa"
        fill_in ("Confirm Password"), :with =>"aaaa"
        click_button ("Sign up")
        expect(page).to have_text(/Recruitor's SignUp/i)
      end
    end
  end
end
