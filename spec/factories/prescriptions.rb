FactoryGirl.define do
  factory :prescription do
    drug "Crestor"
    quantity "30"
    dose_count "1"
    frequency "once a day"
    start_date "1/1/2016"
    physician
    user
  end
end
