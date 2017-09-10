require 'test_helper'

class EntrysheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get entrysheets_new_url
    assert_response :success
  end

  test "should get edit" do
    get entrysheets_edit_url
    assert_response :success
  end

end
