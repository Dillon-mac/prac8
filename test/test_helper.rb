ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def login_as(user)
    post login_url params: { name: user.name, password: 'secret' }
  end

  def logout
    delete logout_url
  end

  def setup
    login_as users(:one)
  end

  # Add more helper methods to be used by all tests here...
end
