require 'test_helper'

class TottlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tottle = tottles(:one)
  end

  test "should get index" do
    get tottles_url
    assert_response :success
  end

  test "should get new" do
    get new_tottle_url
    assert_response :success
  end

  test "should create tottle" do
    assert_difference('Tottle.count') do
      post tottles_url, params: { tottle: { message: @tottle.message, user_id: @tottle.user_id } }
    end

    assert_redirected_to tottle_url(Tottle.last)
  end

  test "should show tottle" do
    get tottle_url(@tottle)
    assert_response :success
  end

  test "should get edit" do
    get edit_tottle_url(@tottle)
    assert_response :success
  end

  test "should update tottle" do
    patch tottle_url(@tottle), params: { tottle: { message: @tottle.message, user_id: @tottle.user_id } }
    assert_redirected_to tottle_url(@tottle)
  end

  test "should destroy tottle" do
    assert_difference('Tottle.count', -1) do
      delete tottle_url(@tottle)
    end

    assert_redirected_to tottles_url
  end
end
