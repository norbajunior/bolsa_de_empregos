require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:candidates).through(:interests).source(:interested)

    should have_many(:interested_candidates).through(:interested).source(:user)
  end
end
