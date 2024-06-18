require "test_helper"

class User::MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_maps_show_url
    assert_response :success
  end
end
