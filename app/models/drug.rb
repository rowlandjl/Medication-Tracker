class Drug < ActiveRecord::Base
  has_many :prescriptions

  validates :name, presence: true
end
