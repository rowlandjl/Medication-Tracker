class Drug < ActiveRecord::Base
  has_many :prescriptions

end
