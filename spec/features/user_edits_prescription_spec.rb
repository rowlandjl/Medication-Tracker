require 'rails_helper'

feature 'User edits prescription', %Q{
  As an authenticated user
  I want to edit my medications
  So that I can keep my medication list current
} do


  scenario 'user provides valid information' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:prescription, user: user)

    sign_in(user)

    click_link "Crestor"
    click_link "Edit Prescription"

    fill_in "drug_name", with: "Crestor"
    fill_in "dose_count", with: "2"

    click_button "Update"

    click_link "Crestor"

    expect(page).to have_content "2 once a day"
  end

end
