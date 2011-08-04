require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	setup do
		# puts "\n=========================="
		# puts "= Setup text database"
		# puts "=========================="
		# Category.all.each do | category |
			# puts "#{ category }"
			# category.attributes.each do | key, value |
				# puts "\t#{ key } => #{ value }"
			# end
		# end
		# puts "=========================="
	
		@category = categories(:one)
		# Category.create :parent => 0,
						# :name => R
		@update = { :parent => "ROOT_NODE", 
				:name => "NewCategory"}
	end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      # post :create, :category => @category.attributes
      post :create, :category => @update
    end

    # assert_redirected_to category_path(assigns(:category))
    assert_redirected_to categories_path
  end

  test "should show category" do
  	# puts "\n=========================="
	# puts "= should show category"
	# puts "=========================="
	# puts "@category class is #{ @category.class }"
	# puts "@category.to_param is #{ @category.to_param }"
	# puts "=========================="
  
    get :show, :id => @category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @category.to_param
    assert_response :success
  end

  test "should update category" do
	# puts "\n=========================="
	# puts "= should update category"
	# puts "=========================="
	# puts "#{ @category.class }"
	# @category.attributes.each do | key, value |
		# puts "#{ key } => #{ value }"
	# end
	# puts "=========================="
  
    put :update, :id => @category.to_param, :category => @category.attributes
    # assert_redirected_to category_path(assigns(:category))
    assert_redirected_to categories_path
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, :id => @category.to_param
    end

    assert_redirected_to categories_path
  end
end
