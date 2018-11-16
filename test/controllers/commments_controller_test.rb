require 'test_helper'

class CommmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commment = commments(:one)
  end

  test "should get index" do
    get commments_url, as: :json
    assert_response :success
  end

  test "should create commment" do
    assert_difference('Commment.count') do
      post commments_url, params: { commment: { comment: @commment.comment, product_id: @commment.product_id, user_id: @commment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show commment" do
    get commment_url(@commment), as: :json
    assert_response :success
  end

  test "should update commment" do
    patch commment_url(@commment), params: { commment: { comment: @commment.comment, product_id: @commment.product_id, user_id: @commment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy commment" do
    assert_difference('Commment.count', -1) do
      delete commment_url(@commment), as: :json
    end

    assert_response 204
  end
end
