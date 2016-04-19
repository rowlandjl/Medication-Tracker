require 'rails_helper'
require 'support/authentication_helper'

feature 'User deletes prescription', %Q{
  As an authenticated user
  I want to delete my medication
  Because I am no longer taking it
} do


  scenario 'user deletes medication' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:prescription, user: user)

    sign_in(user)

    click_link "Crestor"
    click_link "Delete Prescription"

    expect(page).to_not have_content "Crestor"
  end

end
