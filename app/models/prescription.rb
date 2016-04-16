class Prescription < ActiveRecord::Base
  belongs_to :user

  validates :drug, :user_id, presence: true
end
