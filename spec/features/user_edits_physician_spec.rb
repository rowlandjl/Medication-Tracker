require 'rails_helper'

feature 'User edits a physician', %Q{
  As an authenticated user
  I want to edit a contact
  So that I can keep the information up to date
} do

  scenario 'user provides valid information' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:physician, user: user)

    sign_in(user)

    click_link "John Smith"
    click_link "Edit Physician"

    fill_in "physician_name", with: "John Smith"
    fill_in "physician_phone", with: "123-456-7890"

    click_button "Update"
    click_link "John Smith"

    expect(page).to have_content "123-456-7890"
  end
end
