require 'test_helper'

class CustomListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get custom_lists_index_url
    assert_response :success
  end

  test "should get new" do
    get custom_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get custom_lists_create_url
    assert_response :success
  end

  test "should get edit" do
    get custom_lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get custom_lists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get custom_lists_destroy_url
    assert_response :success
  end

end
