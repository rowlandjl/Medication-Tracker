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

    fill_in "name", with: physician.name
    fill_in "office", with: physician.office
    fill_in "address", with: physician.address
    fill_in "city", with: physician.city
    fill_in "state", with: physician.state
    fill_in "zip", with: physician.zip
    fill_in "phone", with: physician.phone
    click_button "Add Physician"

    expect(page).to have_content "John Smith"

  end

  scenario 'user provides invalid information' do
    click_button "Add Physician"

    expect(page).to have_content "can't be blank"
  end
end
