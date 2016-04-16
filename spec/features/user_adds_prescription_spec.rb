require 'rails_helper'
require 'support/authentication_helper'

feature 'User creates prescription', %Q{
  As an authenticated user
  I want to enter one of my medications
  So that I can track my current medications
} do

#   Acceptance Criteria:
# - I must be logged in
# - There is a link to 'Add a new medication'
# - The new medication page has form for:
#   - Name
#   - Strength
#   - Quantity
#   - Frequency
#   - Prescriber (string name)
#   - Start date
#   - End Date
# - The form requires user to provide all information
# - My new medication is added

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
    click_link "Add Prescription"
  end

  scenario 'User provides valid information' do
    rx = FactoryGirl.create(:prescription)

    fill_in "drug_name", with: rx.drug
    fill_in "Quantity", with: rx.quantity
    fill_in "Dose Count", with: rx.dose_count
    fill_in "Frequency", with: rx.frequency
    fill_in "Start Date", with: rx.start_date
    fill_in "Physician Name", with: rx.physician_name
    click_button "Create Prescription"

    expect(page).to have_content "Crestor"
  end

  scenario 'User provides invalid information' do
    click_button "Create Prescription"

    expect(page).to have_content "can't be blank"
  end

end
