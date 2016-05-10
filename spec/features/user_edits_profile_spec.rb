require 'rails_helper'
require 'support/authentication_helper'

feature 'User edits profile', %Q{
  As an authenticated user
  I want to update my information
  So that I can keep my profile current
} do

#   Acceptance Criteria:
# - I must be logged in & current user
# - There is a link to 'Edit Profile'
# - The edit profile page has form for:
#   - First Name
#   - Last Name
#   - Date of Birth
# - The form requires user to provide all required information
# - My profile is updated once I click "update profile"

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
    click_link "Edit Profile"
  end

  scenario 'user provides valid information' do
    fill_in "user_first_name", with: user.first_name
    fill_in "user_last_name", with: "Smith"
    fill_in "user_dob", with: user.dob
    fill_in "user_email", with: "test@example.com"
    fill_in "user_current_password", with: user.password
    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario 'user provides invalid information' do
    click_button "Update"

    expect(page).to have_content "can't be blank"
  end

end
