FactoryGirl.define do
  factory :prescription do
    drug_name "Crestor"
    quantity "30"
    dose_count "1"
    frequency "once a day"
    start_date "1/1/2016"
    physician_name "John Doe"
  end
end
