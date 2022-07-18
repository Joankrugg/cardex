require 'test_helper'

class MailOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mail_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get mail_orders_create_url
    assert_response :success
  end

  test "should get show" do
    get mail_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get mail_orders_edit_url
    assert_response :success
  end

  test "should get update" do
    get mail_orders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mail_orders_destroy_url
    assert_response :success
  end

end
