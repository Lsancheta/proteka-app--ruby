require "test_helper"

class PostoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posto_index_url
    assert_response :success
  end
end
