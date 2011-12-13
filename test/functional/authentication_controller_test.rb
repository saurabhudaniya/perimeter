require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get check" do
    get :check
    assert_response :success
  end

end
