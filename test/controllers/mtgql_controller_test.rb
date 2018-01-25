require 'test_helper'

class MtgqlControllerTest < ActionDispatch::IntegrationTest
  test "can access get /v1" do
    get v1_url
    assert_response :success
  end

  test "can access post /v1" do
    post v1_url
    assert_response :success
  end
end
