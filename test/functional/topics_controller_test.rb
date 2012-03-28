require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

  test "should get like" do
    get :like
    assert_response :success
  end

end
