require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to :user
  end

  context 'validations' do
    should validate_presence_of :title
    should validate_presence_of :date
    should validate_presence_of :summary
    should validate_presence_of :text
    should validate_presence_of :image
  end
end
