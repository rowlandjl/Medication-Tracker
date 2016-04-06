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

  scenario "there is a link for user to sign up" do
    visit root_path

    expect(page).to have_content "Sign Up"
  end

  scenario "sign up form is provided" do
    visit new_user_registration_path

    expect(page).to have_content "First Name"
    expect(page).to have_content "Last Name"
    expect(page).to have_content "Date of Birth"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    expect(page).to have_content "Password confirmation"
  end

  scenario "user provides valid information" do
    user = FactoryGirl.create(:user)
    email = generate :email

    visit root_path

    click_link("Sign Up")
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Date of Birth", with: user.dob
    fill_in "Email", with: email
    fill_in "Password", with: user.password
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
