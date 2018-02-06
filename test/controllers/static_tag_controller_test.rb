require 'test_helper'

class StaticTagControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_tag_index_url
    assert_response :success
  end

  test "should get show" do
    get static_tag_show_url
    assert_response :success
  end

end
