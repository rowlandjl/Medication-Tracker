class Physician < ActiveRecord::Base
  belongs_to :user
  has_many :prescriptions

  validates :user_id, :name, :phone, presence: true
end
