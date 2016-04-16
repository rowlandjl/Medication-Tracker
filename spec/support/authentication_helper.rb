def sign_in(user)
  visit new_user_session_path
  fill_in "email", with: user.email
  fill_in "password", with: user.password
  click_button "Log in"
end

def create_prescription(med)
  visit new_prescription_path
  fill_in "drug_name", with: med.drug
  click_button "Add Prescription"
end
