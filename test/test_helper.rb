ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class CarrierWave::Mount::Mounter
  def store!
    # Not storing uploads in the tests
  end
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  CarrierWave.root = 'test/fixtures/files'

  # Add more helper methods to be used by all tests here...

  def after_teardown
    super

    CarrierWave.clean_cached_files!(0)
  end
  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def fixture_file_upload(path, mime_type = nil, binary = false)
     if self.class.respond_to?(:fixture_path) && self.class.fixture_path
       path = File.join(self.class.fixture_path, path)
     end

     Rack::Test::UploadedFile.new(path, mime_type, binary)
   end
end
