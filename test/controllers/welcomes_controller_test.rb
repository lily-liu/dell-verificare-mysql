require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @welcome = welcomes(:one)
  end

  test "should get index" do
    get welcomes_url, as: :json
    assert_response :success
  end

  test "should create welcome" do
    assert_difference('Welcome.count') do
      post welcomes_url, params: { welcome: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show welcome" do
    get welcome_url(@welcome), as: :json
    assert_response :success
  end

  test "should update welcome" do
    patch welcome_url(@welcome), params: { welcome: {  } }, as: :json
    assert_response 200
  end

  test "should destroy welcome" do
    assert_difference('Welcome.count', -1) do
      delete welcome_url(@welcome), as: :json
    end

    assert_response 204
  end
end
