require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conversations_index_url
    assert_response :success
  end

  test "should get user" do
    get conversations_user_url
    assert_response :success
  end

  test "should get room" do
    get conversations_room_url
    assert_response :success
  end

  test "should get latest" do
    get conversations_latest_url
    assert_response :success
  end

  test "should get popular" do
    get conversations_popular_url
    assert_response :success
  end

  test "should get show" do
    get conversations_show_url
    assert_response :success
  end

  test "should get new" do
    get conversations_new_url
    assert_response :success
  end

  test "should get edit" do
    get conversations_edit_url
    assert_response :success
  end

end
