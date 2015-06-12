require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  setup { @offer = offers(:ror_engineer) }

  context 'associations' do
    should belong_to :entity

    should have_many :applications
    should have_many(:candidates).through(:applications)
  end

  context 'validations' do
    should validate_presence_of :title
    should validate_presence_of :start_at
    should validate_presence_of :end_at
    should validate_presence_of :description
    should validate_presence_of :photo
    should validate_presence_of :professional_activity
    should validate_presence_of :contract
  end

  context '#entity_name' do
    should 'delegate name to #entity' do
      assert_same @offer.entity_name, @offer.entity.name
    end
  end
end
