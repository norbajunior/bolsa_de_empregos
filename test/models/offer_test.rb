require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to :entity
  end

  context 'validations' do
    should validate_presence_of :title
    should validate_presence_of :start_at
    should validate_presence_of :end_at
    should validate_presence_of :description
  end
end
