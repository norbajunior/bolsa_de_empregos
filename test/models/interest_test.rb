require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:interested).class_name('User')
    should belong_to :user
  end

  context 'validations' do
    should validate_presence_of :interested_id
    should validate_presence_of :user_id

    should validate_uniqueness_of(:interested_id).scoped_to(:user_id)
  end
end
