require 'test_helper'

class AllControllerTest < ActionController::TestCase
  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get articles" do
    get :articles
    assert_response :success
  end

  test "should get products" do
    get :products
    assert_response :success
  end

  test "should get showuser" do
    get :showuser
    assert_response :success
  end

  test "should get showarticle" do
    get :showarticle
    assert_response :success
  end

  test "should get showproduct" do
    get :showproduct
    assert_response :success
  end

end
