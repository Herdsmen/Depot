require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
	setup do
		# puts "\n=========================="
		# puts "= Setup product text database"
		# puts "=========================="
		# Category.all.each do | category |
			# puts "#{ category }"
			# category.attributes.each do | key, value |
				# puts "\t#{ key } => #{ value }"
			# end
		# end
		
		# Product.all.each do | product |
			# puts "#{ product }"
			# product.attributes.each do | key, value |
				# puts "\t#{ key } => #{ value }"
			# end
		# end
		# puts "=========================="
  
		@product = products(:one)
		@update = {
		  :title        => 'Lorem Ipsum',
		  :description  => 'Wibbles sre fun!',
		  :image_url    => 'lorem.jpg',
		  :price        => 19.95,
		  :category_ids => [categories(:one).id]
		}		  
	end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => @update #product.attributes
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, :id => @product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, :id => @product.to_param, :product => @update #@product.attributes
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product.to_param
    end

    assert_redirected_to products_path
  end
end
