require 'rails_helper'

describe Drug do
  it { should have_many(:prescriptions) }
  it { should validate_presence_of(:name) }
end
