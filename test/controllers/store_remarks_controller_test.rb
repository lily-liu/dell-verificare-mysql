require 'test_helper'

class StoreRemarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue = store_remarks(:one)
  end

  test "should get index" do
    get store_remarks_url, as: :json
    assert_response :success
  end

  test "should create store_remark" do
    assert_difference('StoreRemark.count') do
      post store_remarks_url, params: { store_remark: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show store_remark" do
    get store_remark_url(@issue), as: :json
    assert_response :success
  end

  test "should update store_remark" do
    patch store_remark_url(@issue), params: {issue: {  } }, as: :json
    assert_response 200
  end

  test "should destroy store_remark" do
    assert_difference('StoreRemark.count', -1) do
      delete store_remark_url(@store_remark), as: :json
    end

    assert_response 204
  end
end
