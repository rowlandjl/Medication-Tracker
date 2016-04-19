require 'rails_helper'
require 'support/authentication_helper'

feature 'User views prescription details', %Q{
  As an authenticated user
  I want to view details about one of my medications
  So that I can get more information about it
} do

  scenario 'user views details about prescription' do
    user = FactoryGirl.create(:user)
<<<<<<< HEAD
    FactoryGirl.create(:prescription, user: user)

    sign_in(user)
=======

>>>>>>> user_edits_prescription
    click_link "Crestor"

    expect(page).to have_content "Crestor"
    expect(page).to have_content "Start Date"
    expect(page).to have_content "Directions"
  end
<<<<<<< HEAD
=======

>>>>>>> user_edits_prescription
end
