require 'rails_helper'
require 'support/authentication_helper'

feature 'User logs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can track my medications and medical history
} do

#   Acceptance Criteria:
# - There is a link to "log in"
# - The log in page has a form for:
#   - Email
#   - Password
# - The form requires me to provide all information
# - I am logged in once i click "log in" button

  scenario 'there is a link for the user to log in' do
    visit root_path

    expect(page).to have_content "Log In"
  end

  scenario 'user provides valid information' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Sign Out"
  end

  scenario 'user provides invalid information' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    click_button "Log in"

    expect(page).to have_content "Invalid email or password."
  end

end
