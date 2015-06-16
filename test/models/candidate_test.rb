require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:entities).through(:interests).source(:user)
    should have_many(:interested_entities).through(:interested).source(:interested)
    should have_many(:applications).dependent(:restrict_with_exception)
    should have_many(:applied_offers).through(:applications).source(:offer)
  end

  context 'validations' do
    should validate_presence_of :photo
    should validate_presence_of :address
    should validate_presence_of :place
    should validate_presence_of :zipcode
    should validate_presence_of :contact
    should validate_presence_of :presentation
    should validate_presence_of :date_of_birth
    should validate_presence_of :professional_area
    should validate_presence_of :cv
    should validate_presence_of :scholarity
    should validate_presence_of :employment_status

    should validate_length_of(:address).is_at_most(255)
    should validate_length_of(:zipcode).is_equal_to(8)
    should validate_length_of(:contact).is_at_most(12)
    should validate_length_of(:identity_number).is_at_most(15)

    should allow_value('http://wiremaze.com').for(:site)
    should allow_value('https://wiremaze.com').for(:site)
    should allow_value('wiremaze.com').for(:site)

    should_not allow_value('htt://wiremaze.com').for(:site)
    should_not allow_value('http://wiremaze').for(:site)
  end
end
