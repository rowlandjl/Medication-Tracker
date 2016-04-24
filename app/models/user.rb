class User < ActiveRecord::Base
  has_many :prescriptions
  has_many :physicians

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name, :last_name, presence: true
end
