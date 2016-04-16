require 'rails_helper'
require 'support/authentication_helper'

feature 'User deletes prescription', %Q{
  As an authenticated user
  I want to delete my medication
  Because I am no longer taking it
} do

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
    click_link "Add Prescription"
  end

  scenario 'user deletes medication' do
    rx = FactoryGirl.create(:prescription)

    visit prescriptions_path

    click_link "Crestor"
    click_link "Delete Prescription"

    expect(page).to_not have_content "Crestor"
  end

end
