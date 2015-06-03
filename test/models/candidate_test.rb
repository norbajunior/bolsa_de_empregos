require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:entities).through(:interests).source(:interested)

    should have_many(:interested_entities).through(:interested).source(:user)
  end
end
