require 'test_helper'

class FinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fines_index_url
    assert_response :success
  end

  test "should get show" do
    get fines_show_url
    assert_response :success
  end

  test "should get new" do
    get fines_new_url
    assert_response :success
  end

  test "should get create" do
    get fines_create_url
    assert_response :success
  end

  test "should get edit" do
    get fines_edit_url
    assert_response :success
  end

  test "should get update" do
    get fines_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fines_destroy_url
    assert_response :success
  end

end
