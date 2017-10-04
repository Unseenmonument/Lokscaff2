require 'test_helper'

class RumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rume = rumes(:one)
  end

  test "should get index" do
    get rumes_url
    assert_response :success
  end

  test "should get new" do
    get new_rume_url
    assert_response :success
  end

  test "should create rume" do
    assert_difference('Rume.count') do
      post rumes_url, params: { rume: { description: @rume.description, guidelines: @rume.guidelines, listeners: @rume.listeners, name: @rume.name, room_id: @rume.room_id, user_id: @rume.user_id } }
    end

    assert_redirected_to rume_url(Rume.last)
  end

  test "should show rume" do
    get rume_url(@rume)
    assert_response :success
  end

  test "should get edit" do
    get edit_rume_url(@rume)
    assert_response :success
  end

  test "should update rume" do
    patch rume_url(@rume), params: { rume: { description: @rume.description, guidelines: @rume.guidelines, listeners: @rume.listeners, name: @rume.name, room_id: @rume.room_id, user_id: @rume.user_id } }
    assert_redirected_to rume_url(@rume)
  end

  test "should destroy rume" do
    assert_difference('Rume.count', -1) do
      delete rume_url(@rume)
    end

    assert_redirected_to rumes_url
  end
end
