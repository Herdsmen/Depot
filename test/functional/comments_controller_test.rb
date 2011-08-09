require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @update = {
      :title        => 'Test title',
      :comment      => 'Test comment!',
      :product_id   => products(:ruby).id,
      :user_id      => users(:one).id
    }
  end
  
  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, :comment => @update
    end
  end
end
