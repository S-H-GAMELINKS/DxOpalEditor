require "test_helper"

class RoutesTest < ActionDispatch::IntegrationTest
  test "should get /" do
    get "/"
    assert_response :success
  end

  test "should get /sources" do
    get "/sources"
    assert_response :success
  end

  test "should get /sources/1" do
    get "/sources/1"
    assert_response :success
  end

  test "should get /sources/1/edit" do
    get "/sources/1/edit"
    assert_response :success
  end

  test "should get /sources/new" do
    get "/sources/new"
    assert_response :success
  end
end