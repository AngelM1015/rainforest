require 'test_helper'

class OurServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @our_service = our_services(:one)
  end

  test "should get index" do
    get our_services_url
    assert_response :success
  end

  test "should get new" do
    get new_our_service_url
    assert_response :success
  end

  test "should create our_service" do
    assert_difference('OurService.count') do
      post our_services_url, params: { our_service: {  } }
    end

    assert_redirected_to our_service_url(OurService.last)
  end

  test "should show our_service" do
    get our_service_url(@our_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_our_service_url(@our_service)
    assert_response :success
  end

  test "should update our_service" do
    patch our_service_url(@our_service), params: { our_service: {  } }
    assert_redirected_to our_service_url(@our_service)
  end

  test "should destroy our_service" do
    assert_difference('OurService.count', -1) do
      delete our_service_url(@our_service)
    end

    assert_redirected_to our_services_url
  end
end
