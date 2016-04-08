require 'rails_helper'
require 'support/authentication_helper'

feature 'User deletes account', %Q{
  As an authenticated user
  I want to delete my account
  So that my information is no longer available in the app
} do

#   Acceptance Criteria:
# - I must be logged in
# - There is a link to 'Edit Profile'
# - There is a link to 'Cancel my account'
# - My profile is deleted once i cancel my account

  scenario 'user deletes account' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    click_link "Edit Profile"
    click_button "Cancel my account"

    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Log In"
  end

end
