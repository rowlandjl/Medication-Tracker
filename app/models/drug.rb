class Drug < ActiveRecord::Base
  has_many :prescriptions

  validates :drug, presence: true 
end
