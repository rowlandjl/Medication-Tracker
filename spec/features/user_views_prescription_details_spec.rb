require 'rails_helper'

feature 'User views prescription details', %Q{
  As an authenticated user
  I want to view details about one of my medications
  So that I can get more information about it
} do

  scenario 'user views details about prescription' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:prescription, user: user)

    sign_in(user)

    click_link "Crestor"

    expect(page).to have_content "Crestor"
    expect(page).to have_content "Quantity"
    expect(page).to have_content "Directions"
  end

end
