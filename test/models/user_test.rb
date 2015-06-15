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

    should validate_length_of(:name).is_at_least(2).is_at_most(80)
    should validate_length_of(:password).is_at_least(6)

    should validate_uniqueness_of(:email).case_insensitive
    should validate_length_of(:email).is_at_most(100)

    should allow_value('norberto.oliveira@wiremaze.com').for(:email)
    should_not allow_value('norberto.oliveirawiremaze.com').for(:email)
  end

  context '#generate_password_reset_token!' do
    should 'generate a password token and update user' do
      assert_nil users(:norberto).password_reset_token

      users(:norberto).generate_password_reset_token!

      assert_not_nil users(:norberto).password_reset_token
    end
  end

  context '#entity?' do
    should 'return true when user is an #entity?' do
      @user.type = 'Entity'

      assert @user.entity?
    end
  end

  context '#candidate?' do
    should 'return true when user is a #candidate?' do
      @user.type = 'Candidate'

      assert @user.candidate?
    end
  end

  context '#backoffice?' do
    should 'return true when user is a #backoffice?' do
      @user.type = 'Backoffice'

      assert @user.backoffice?
    end
  end
end
