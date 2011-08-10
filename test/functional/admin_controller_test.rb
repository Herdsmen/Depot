require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    user_login :one
    get :index
    assert_response :success
  end
  
  test "should ship" do
    user_login :one
    order = orders(:one)
    #cart = (carts(:one))
    #order.add_line_items_from_cart(cart)
    post :ship, :id => order.id
    assert_redirected_to admin_url
    assert_equal true , Order.find(order.id).status
    
  end

end
