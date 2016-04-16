require 'rails_helper'

feature 'User signs up', %Q{
  As a prospective user
  I want to create an account
  So that I can track my medications and medical history
} do

  # Acceptance Criteria:
  # - There is a link to "sign up"
  # - The sign up page has a form for:
  #   - First Name
  #   - Last Name
  #   - Email
  #   - Password
  #   - Password Confirmation
  # - The form requires me to provide all information
  # - I am logged in once I sign up

  scenario "user provides valid information" do
    user = FactoryGirl.create(:user)
    email = generate :email

    visit root_path

    click_link("Sign Up")
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Date of Birth", with: user.dob
    fill_in "email", with: email
    fill_in "password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user provides invalid information" do
    visit new_user_registration_path
    click_button "Sign up"

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Sign Out"
  end
end
