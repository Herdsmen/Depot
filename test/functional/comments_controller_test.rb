require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @update = {
      :title        => 'Test title',
      :comment      => 'Test comment!',
      :product_id   => products(:ruby).id
    }
  end
  
  test "should create comment" do
    user_login :one
    assert_difference('Comment.count') do
      post :create, :comment => @update
    end
  end
end
