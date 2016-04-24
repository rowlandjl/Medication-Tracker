require 'rails_helper'

feature 'User views list of physicians', %Q{
  As an authenticated user
  I want to view a list of my medical contacts
} do

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }

  let!(:user_physician) { FactoryGirl.create(:physician, name: "John Smith", user:user) }
  let!(:another_user_physician) { FactoryGirl.create(:physician, name: "Jane Smith", user:another_user ) }

  before(:each) do
    sign_in(user)
    visit root_path
  end

  scenario 'user views list of physicians on dashboard' do
    expect(page).to have_content user_physician.name
  end

  scenario 'user cannot view other users physicians' do
    expect(page).to_not have_content "Jane Smith"
  end

end
