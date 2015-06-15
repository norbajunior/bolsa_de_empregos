require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:offer)
    should belong_to(:candidate).class_name('User')
  end

  context 'validations' do
    should validate_presence_of :offer_id
    should validate_presence_of :candidate_id

    should validate_uniqueness_of(:offer_id).scoped_to(:candidate_id)
  end
end
