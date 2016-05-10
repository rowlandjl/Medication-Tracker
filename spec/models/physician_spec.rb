require 'rails_helper'

describe Physician do
  it { should belong_to(:user) }
  it { should have_many(:prescriptions)}
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone) }
end
