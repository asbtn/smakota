require "test_helper"

class LandingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get landing_url

    assert_response :success
  end
end
