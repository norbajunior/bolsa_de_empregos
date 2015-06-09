require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup { @user = User.new }

  context 'associations' do
    should have_many :interests # foreign_key: :interested_id

    should have_many(:interested).class_name('Interest') # foreign_key: :user_id
  end

  context 'validations' do
    should have_secure_password
    should validate_confirmation_of(:password).on(:update)

    should validate_presence_of :email
    should validate_presence_of :name
    should validate_presence_of :photo
    should validate_presence_of :address
    should validate_presence_of :place
    should validate_presence_of :zipcode
    should validate_presence_of :contact
    should validate_presence_of :presentation

    should allow_value('norbejunior@gmail.com').for(:email)
    should_not allow_value('norbejuniorgmail.com').for(:email)
  end

  context '#entity?' do
    should 'return true when user is an #entity?' do
      @user.type = 'Entity'

      assert @user.entity?
    end
  end

  context '#candidate?' do
    should 'returns true when user is a #candidate?' do
      @user.type = 'Candidate'

      assert @user.candidate?
    end
  end
end
