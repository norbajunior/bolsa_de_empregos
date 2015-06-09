require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:offers).dependent(:destroy)
    should have_many(:candidates).through(:interests).source(:user)
    should have_many(:interested_candidates).through(:interested).source(:interested)
  end

  context 'validations' do
    should validate_presence_of :professional_activity
  end
end
