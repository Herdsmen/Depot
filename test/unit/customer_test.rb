require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "customer attributes must not be empty" do
    customer = Customer.new
    assert customer.invalid?
    assert customer.errors[:name].any?
    assert customer.errors[:password].any?
  end
  
  test "customer's password must be same with password_confirmation " do
    customer = Customer.new(:name       => "1",
                          :password => "1")
    customer.password_confirmation='2'
    assert customer.invalid?
    customer.password_confirmation='1'
    assert customer.valid?    
  end
  
  test "customer's name must be unique " do
    customer = Customer.new(:name       => users(:customer).name,
                          :password => "1",
                          :password_confirmation=>'1')
    assert !customer.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'), customer.errors[:name].join(';')
  end
  



end
