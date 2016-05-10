require 'rails_helper'

describe Prescription do
  it { should belong_to(:user) }
  it { should belong_to(:physician) }
  it { should belong_to(:drug) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:drug) }
end
