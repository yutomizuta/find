require "test_helper"

class Public::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_students_index_url
    assert_response :success
  end

  test "should get show" do
    get public_students_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_students_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_students_update_url
    assert_response :success
  end
end
