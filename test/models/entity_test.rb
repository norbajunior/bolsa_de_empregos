require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:offers).dependent(:destroy)
    should have_many(:candidates).through(:interests).source(:user)
    should have_many(:interested_candidates).through(:interested).source(:interested)
  end

  context 'validations' do
    should validate_presence_of :professional_activity
    should validate_presence_of :address
    should validate_presence_of :place
    should validate_presence_of :zipcode
    should validate_presence_of :contact
    should validate_presence_of :presentation
    should validate_presence_of :nif

    should validate_length_of(:address).is_at_most(255)
    should validate_length_of(:zipcode).is_equal_to(8)
    should validate_length_of(:contact).is_at_least(8).is_at_most(20)
    should validate_length_of(:other_contact).is_at_least(8).is_at_most(20)

    should allow_value('http://wiremaze.com').for(:site)
    should allow_value('https://wiremaze.com').for(:site)
    should allow_value('wiremaze.com').for(:site)

    should_not allow_value('htt://wiremaze.com').for(:site)
    should_not allow_value('http://wiremaze').for(:site)
  end
end
