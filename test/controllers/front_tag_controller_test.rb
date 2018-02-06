require 'test_helper'

class FrontTagControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_tag_index_url
    assert_response :success
  end

  test "should get show" do
    get front_tag_show_url
    assert_response :success
  end

end
