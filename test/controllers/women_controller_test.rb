require 'test_helper'

class WomenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @woman = women(:one)
  end

  test "should get index" do
    get women_url
    assert_response :success
  end

  test "should get new" do
    get new_woman_url
    assert_response :success
  end

  test "should create woman" do
    assert_difference('Woman.count') do
      post women_url, params: { woman: {  } }
    end

    assert_redirected_to woman_url(Woman.last)
  end

  test "should show woman" do
    get woman_url(@woman)
    assert_response :success
  end

  test "should get edit" do
    get edit_woman_url(@woman)
    assert_response :success
  end

  test "should update woman" do
    patch woman_url(@woman), params: { woman: {  } }
    assert_redirected_to woman_url(@woman)
  end

  test "should destroy woman" do
    assert_difference('Woman.count', -1) do
      delete woman_url(@woman)
    end

    assert_redirected_to women_url
  end
end
