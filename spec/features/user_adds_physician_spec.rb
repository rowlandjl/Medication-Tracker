require 'rails_helper'

feature 'User adds physician', %Q{
  As an authenticated user
  I want to add a physician
  So that I can keep track of my medical contacts
} do

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
    click_link "Add Physician"
  end

  scenario 'user provides valid information' do
    physician = FactoryGirl.create(:physician, user:user)

    fill_in "physician_name", with: physician.name
    fill_in "physician_office", with: physician.office
    fill_in "physician_address", with: physician.address
    fill_in "physician_city", with: physician.city
    fill_in "physician_state", with: physician.state
    fill_in "physician_zip", with: physician.zip
    fill_in "physician_phone", with: physician.phone
    click_button "Add Physician"

    expect(page).to have_content "John Smith"

  end

  scenario 'user provides invalid information' do
    click_button "Add Physician"

    expect(page).to have_content "can't be blank"
  end
end
