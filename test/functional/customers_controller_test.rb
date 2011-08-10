require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    customer_login :customer    
    @customer = users(:customer)
    @customer_update = {
      :name        => 'Lorem Ipsum',
      :hashed_password  => User.encrypt_password('secret',SALT),
      :salt    => SALT
    }
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
    get :show
    assert_response :success
  end
  
  test "should show_orders" do
    get :show_orders
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should update customer" do
    put :update, :id => @customer.to_param, :customer => @customer_update
    assert_redirected_to customers_path
  end

  test "should destroy customer" do
    logout
    user_login :one
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
  
  test "should collect product" do
    post :collect, :product_id => products(:one).id
    customer=Customer.find(session[:user_id])
    assert_equal 1,customer.products.count    
  end
  
  test "should remove_collection product" do
    post :collect, :product_id => products(:one).id
    customer=Customer.find(session[:user_id])
    assert_equal 1,customer.products.count
    post :remove_collection, :product_id => products(:one).id
    assert_equal 0,customer.products.count        
  end
  
  
end
