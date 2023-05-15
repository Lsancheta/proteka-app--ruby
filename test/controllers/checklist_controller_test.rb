require "test_helper"

class ChecklistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checklist_index_url
    assert_response :success
  end
end
