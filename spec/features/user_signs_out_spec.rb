require 'rails_helper'
require 'support/authentication_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
} do

#   Acceptance Criteria:
# - I must be logged in
# - There is a link to "sign out"
# - I am signed out once I click "sign out" link

  scenario 'user signs out of session' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    expect(page).to have_content "Sign Out"

    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully."
  end

end
