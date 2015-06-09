require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password

  context 'associations' do
    should have_many :interests # foreign_key: :interested_id

    should have_many(:interested).class_name('Interest') # foreign_key: :user_id
  end

  context 'validations' do
    should validate_confirmation_of(:password).on(:update)
  end
end
