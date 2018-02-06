require 'test_helper'

class FrontArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_article_index_url
    assert_response :success
  end

  test "should get show" do
    get front_article_show_url
    assert_response :success
  end

end
