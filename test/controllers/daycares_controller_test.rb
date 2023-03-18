require "test_helper"

class DaycaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daycares_index_url
    assert_response :success
  end

  test "should get new" do
    get daycares_new_url
    assert_response :success
  end

  test "should get create" do
    get daycares_create_url
    assert_response :success
  end

  test "should get show" do
    get daycares_show_url
    assert_response :success
  end

  test "should get edit" do
    get daycares_edit_url
    assert_response :success
  end

  test "should get update" do
    get daycares_update_url
    assert_response :success
  end
end
