require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "User should login" do
    dave=users(:one)
    post :create, :name=>dave.name, :password=>'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
    assert_equal 'User', session[:type]
  end
  
  test "Customer should login" do
    customer=users(:customer)
    post :create, :name=>customer.name, :password=>'secret'
    assert_redirected_to customers_path
    assert_equal customer.id, session[:user_id]
    assert_equal 'Customer', session[:type]
    assert_equal session[:user_id],Cart.find_by_id(session[:cart_id]).customer_id
  end
  
  test "should fail login" do
    dave=users(:one)
    post :create, :name=>dave.name, :password=>'wrong'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
    assert_nil session[:user_id]
    assert_nil session[:type]
  end
  


end
