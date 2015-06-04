require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:candidates).through(:interests).source(:user)

    should have_many(:interested_candidates).through(:interested).source(:interested)
  end
end
