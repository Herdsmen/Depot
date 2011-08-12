ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def user_login(user)
    session[:user_id]=users(user).id
    session[:type]='User'
  end
  

  
  def customer_login(customer)
    session[:user_id]=users(customer).id
    session[:type]='Customer'
  end
  
    def logout
    session.delete :user_id
    session.delete :type
  end
  
  #def setup
    #if defined? session
    #login_as :one unless session[:type]
    #end
    #login_as :customer if defined? session
  #end
  

  
end
