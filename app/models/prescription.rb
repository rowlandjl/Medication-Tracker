class Prescription < ActiveRecord::Base
  belongs_to :user

  validates :drug, :user_id, presence: true

  FREQUENCY = [
    'once a day',
    'twice a day',
    'three times a day',
    'four times a day',
    'once a month',
    'once a week',
    'twice a week',
    'three times a week',
    'every other day',
    'every 4 hours',
    'every 6 hours',
    'every 8 hours',
    'every 12 hours',
    'every 4 to 6 hours',
    'every 6 to 8 hours',
    'at bedtime',
    'as needed',
    'as directed'
  ]

  DOSE = [
    '1',
    '1.5',
    '2',
    '2.5',
    '3',
    '3.5',
    '4',
    '4.5',
    '5',
    '5.5',
    '6',
    '6.5',
    '7',
    '7.5',
    '8',
    '8.5',
    '9',
    '9.5',
    '10'
  ]
end
