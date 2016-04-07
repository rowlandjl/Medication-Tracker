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

  scenario 'user logs in and wants to edit profile' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    expect(page).to have_content "Edit Profile"

    click_link "Edit Profile"

    expect(page).to have_content "First Name"
    expect(page).to have_content "Last Name"
    expect(page).to have_content "Date of Birth"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end

  scenario 'user provides valid information' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    click_link "Edit Profile"

    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: "Smith"
    fill_in "Date of Birth", with: user.dob
    fill_in "Email", with: "test@example.com"
    fill_in "Current password", with: user.password
    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario 'user provides invalid information' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    click_link "Edit Profile"

    click_button "Update"

    expect(page).to have_content "can't be blank"
  end

end
