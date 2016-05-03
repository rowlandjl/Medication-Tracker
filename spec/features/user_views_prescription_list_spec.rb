require 'rails_helper'
require 'support/authentication_helper'

feature 'User views list of prescriptions', %Q{
  As an authenticated user
  I want to view a list of my medications
} do

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }

  let(:prozo) { FactoryGirl.create(:drug, name: "Prozovoloftin")}
  let(:caffeine) { FactoryGirl.create(:drug, name: "Caffeine")}

  let!(:user_prescription) { FactoryGirl.create(:prescription, user: user, drug: prozo) }
  let!(:another_user_prescription) { FactoryGirl.create(:prescription, user: another_user, drug: caffeine) }


  before(:each) do
    sign_in(user)
    visit root_path
  end

  scenario 'user can see a list of all prescriptions' do
    expect(page).to have_content "Prozovoloftin"
  end

  scenario 'user cannot view other users prescriptions' do
    expect(page).to_not have_content "Caffeine"
  end
end
