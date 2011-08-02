require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    
    
    @customer = users(:customer)
    hash_password = User.encrypt_password('secret',SALT)
    @customer_update = {
      :name        => 'Lorem Ipsum',
      :hashed_password  => hash_password,
      :salt    => SALT
    }
  end

  test "should get index" do
    login_as :customer
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
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
    assert_difference('Customer.count', -1) do
      delete :destroy, :id => @customer.to_param
    end

    assert_redirected_to customers_path
  end
end
