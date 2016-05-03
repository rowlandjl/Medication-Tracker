require 'rails_helper'

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
  let!(:physician) { FactoryGirl.create(:physician, user: user) }

  before(:each) do
    sign_in(user)
    click_link "Add Prescription"
  end

  scenario 'User provides valid information' do
    rx = FactoryGirl.create(:prescription, user:user, physician: physician)

    fill_in "drug_name", with: rx.drug.name
    fill_in "quantity", with: rx.quantity
    select "1", from: "dose_count"
    select "once a day", from: "frequency"
    fill_in "start_date", with: rx.start_date
    select "John Smith", from:  "physician_name"
    click_button "Add Prescription"

    expect(page).to have_content "Crestor"
  end

  scenario 'User provides invalid information' do
    click_button "Add Prescription"

    expect(page).to have_content "Please provide the name of a prescription drug."
  end

end
