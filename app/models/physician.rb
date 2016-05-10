class Physician < ActiveRecord::Base
  belongs_to :user
  has_many :prescriptions

  validates :user, presence: true
  validates :name, presence: true
  validates :phone, presence: true
end
