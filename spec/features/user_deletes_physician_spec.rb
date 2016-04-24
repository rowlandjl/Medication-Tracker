require 'rails_helper'

feature 'User deletes physician' do

  scenario 'User deletes physician' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:physician, user: user)

    sign_in(user)

    click_link "John Smith"
    click_link "Delete Physician"

    expect(page).to_not have_content "John Smith"
  end
end
