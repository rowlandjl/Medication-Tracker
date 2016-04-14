class Prescription < ActiveRecord::Base
  belongs_to :user

  validates :drug_name, :user_id, presence: true 
end
