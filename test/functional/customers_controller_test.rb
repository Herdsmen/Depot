require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    customer_login :customer
    
    @customer = users(:customer)
    #hash_password = User.encrypt_password('secret',SALT)
    @customer_update = {
      :name        => 'Lorem Ipsum',
      :hashed_password  => User.encrypt_password('secret',SALT),
      :salt    => SALT
    }
  end
  
  teardown do
    logout
  end 

  test "should get index" do
    
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should fail to get new" do
    get :new
    assert_redirected_to store_url
  end

  test "should get new" do
    logout
    get :new
    assert_response :success
  end
  
  test "should fail to create customer" do
    assert_no_difference('Customer.count') do
      post :create, :customer => @customer_update
    end

    assert_redirected_to store_url
  end
  
  test "should create customer" do
    logout
    assert_difference('Customer.count') do
      post :create, :customer => @customer_update
    end

    assert_redirected_to customers_path
  end

  test "should show customer" do
    get :show, :id => @customer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @customer.to_param
    assert_response :success
  end

  test "should update customer" do
    put :update, :id => @customer.to_param, :customer => @customer_update
    assert_redirected_to customers_path
  end

  test "should destroy customer" do
    logout
    login_as :one
    assert_difference('Customer.count', -1) do
      delete :destroy, :id => @customer.to_param
    end

    #assert_redirected_to customers_path
  end
  
    test "should fail to destroy customer" do
    assert_difference('Customer.count', 0) do
      delete :destroy, :id => @customer.to_param
    end

    assert_redirected_to customers_path
  end
  
end
