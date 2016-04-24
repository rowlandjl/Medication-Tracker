class Physician < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :name, :phone, presence: true 
end
