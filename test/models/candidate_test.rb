require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:entities).through(:interests).source(:user)

    should have_many(:interested_entities).through(:interested).source(:interested)
  end

  context 'validations' do
    should validate_presence_of :date_of_birth
    should validate_presence_of :professional_area
    should validate_presence_of :cv
    should validate_presence_of :scholarity
    should validate_presence_of :employment_status
  end
end
