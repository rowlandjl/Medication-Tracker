FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Doe"
    dob "1/1/1947"
    email
    password
  end

  sequence :email do |n|
    "person#{n}@test.com"
  end

  sequence :password do |n|
    "#{n}password"
  end
end
