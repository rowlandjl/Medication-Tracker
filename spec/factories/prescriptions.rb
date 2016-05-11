FactoryGirl.define do
  factory :prescription do
    drug
    quantity "30"
    dose_count "1"
    frequency "once a day"
    physician
    user
  end
end
