require "test_helper"

class ZukansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zukans_index_url
    assert_response :success
  end

  test "should get show" do
    get zukans_show_url
    assert_response :success
  end
end
