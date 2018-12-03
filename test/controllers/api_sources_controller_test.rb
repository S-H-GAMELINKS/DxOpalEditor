require "test_helper"

class ApiSourcesControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get "/api/sources"
        assert_response :success
    end
    
    test "should get show" do
        get "/api/sources/1"
        assert_response :success
    end

    test "should get new" do
        get "/api/sources/new"
        assert_response :success
    end

    test "should get edit" do
        get "/api/sources/1/edit"
        assert_response :success
    end

    test "should create" do
        post "/api/sources", params: {source: {name: "test", code: "test"}}
        assert_response :success
    end

    test "should null source can't create" do
        post "/api/sources", params: {source: {name: "", code: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end

    test "should source update" do
        put "/api/sources/1", params: {source: {name: "test", code: "test"}}
        assert_response :success
    end

    test "should null source can't update" do
        put "/api/sources/1", params: {source: {name: "", code: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end

    test "should source delete" do
        delete "/api/sources/1"
        assert_response :success
    end
end