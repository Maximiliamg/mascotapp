require 'test_helper'

class BlockedUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blocked_user = blocked_users(:one)
  end

  test "should get index" do
    get blocked_users_url, as: :json
    assert_response :success
  end

  test "should create blocked_user" do
    assert_difference('BlockedUser.count') do
      post blocked_users_url, params: { blocked_user: { user_id: @blocked_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show blocked_user" do
    get blocked_user_url(@blocked_user), as: :json
    assert_response :success
  end

  test "should update blocked_user" do
    patch blocked_user_url(@blocked_user), params: { blocked_user: { user_id: @blocked_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy blocked_user" do
    assert_difference('BlockedUser.count', -1) do
      delete blocked_user_url(@blocked_user), as: :json
    end

    assert_response 204
  end
end
