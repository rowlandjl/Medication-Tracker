require 'rails_helper'

feature 'User views physician details' do

  scenario 'user views details about physician' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:physician, user: user)

    sign_in(user)

    click_link "John Smith"

    expect(page).to have_content "John Smith"
    expect(page).to have_content "Address"
    expect(page).to have_content "Phone"
  end

end
