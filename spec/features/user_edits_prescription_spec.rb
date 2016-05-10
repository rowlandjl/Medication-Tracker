require 'rails_helper'

feature 'User edits prescription', %Q{
  As an authenticated user
  I want to edit my medications
  So that I can keep my medication list current
} do


  scenario 'user provides valid information' do
    user = FactoryGirl.create(:user)
    physician = FactoryGirl.create(:physician, user: user)
    FactoryGirl.create(:prescription, user: user, physician: physician)

    sign_in(user)

    click_link "Crestor"
    click_link "Edit Prescription"

    fill_in "drug_name", with: "Crestor"
    select "2", from: "prescription_dose_count"

    click_button "Update"

    click_link "Crestor"

    expect(page).to have_content "2 once a day"
  end

end
