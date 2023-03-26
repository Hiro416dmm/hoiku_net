require "test_helper"

class DaycaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daycares_index_url
    assert_response :success
  end

  test "should get show" do
    get daycares_show_url
    assert_response :success
  end
end
