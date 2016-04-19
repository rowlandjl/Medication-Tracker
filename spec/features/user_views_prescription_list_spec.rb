require 'rails_helper'
require 'support/authentication_helper'

feature 'User views list of prescriptions', %Q{
  As an authenticated user
  I want to view a list of my medications
} do

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }

  let!(:user_prescription) { FactoryGirl.create(:prescription, user: user, drug: "Prozovoloftin") }
  let!(:another_user_prescription) { FactoryGirl.create(:prescription, user: another_user, drug: "Caffeine") }

  before(:each) do
    sign_in(user)
    visit root_path
  end

  scenario 'user can see a list of all prescriptions' do
    expect(page).to have_content user_prescription.drug
  end

  scenario 'user cannot view other users prescriptions' do
    expect(page).to_not have_content "Caffeine"
  end
end
