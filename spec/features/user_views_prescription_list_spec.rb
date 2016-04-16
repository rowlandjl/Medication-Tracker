require 'rails_helper'
require 'support/authentication_helper'

feature 'User views list of prescriptions', %Q{
  As an authenticated user
  I want to view a list of my medications
} do

  scenario 'user can see a list of all prescriptions' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    med = FactoryGirl.create(:prescription)
    create_prescription(med)

    click_link "View Details"

    expect(page).to have_content "List of Prescriptions"
    expect(page).to have_content "Crestor"
  end

end
