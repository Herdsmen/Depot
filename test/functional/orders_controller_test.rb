require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    
    @order = orders(:one)
  end

  test "should get index" do
    user_login :one
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    cart = Cart.create
	session[:cart_id] = cart.id
	LineItem.create(:cart => cart, :product => products(:ruby))
	  customer_login :customer
    get :new
    assert_response :success
  end

  test "should create order" do
    customer_login :customer
    assert_difference('Order.count') do
      post :create, :order => @order.attributes
    end

    # assert_redirected_to order_path(assigns(:order))
    assert_redirected_to store_path
  end

  test "should show order" do
    user_login :one
    get :show, :id => @order.to_param
    assert_response :success
  end

  test "should get edit" do
    user_login :one
    get :edit, :id => @order.to_param
    assert_response :success
  end

  test "should update order" do
    user_login :one
    put :update, :id => @order.to_param, :order => @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    user_login :one
    assert_difference('Order.count', -1) do
      delete :destroy, :id => @order.to_param
    end

    assert_redirected_to orders_path
  end
  
  test "requires item in cart" do
  customer_login :customer
	get :new
	assert_redirected_to store_path
	assert_equal flash[:notice], 'Your cart is empty'
  end
end
