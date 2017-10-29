require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get friends" do
    get user_friends_url
    assert_response :success
  end

  test "should get tottles" do
    get user_tottles_url
    assert_response :success
  end

  test "should get rumes" do
    get user_rumes_url
    assert_response :success
  end

  test "should get convos" do
    get user_convos_url
    assert_response :success
  end

  test "should get comments" do
    get user_comments_url
    assert_response :success
  end

  test "should get events" do
    get user_events_url
    assert_response :success
  end

  test "should get favorites" do
    get user_favorites_url
    assert_response :success
  end

end
