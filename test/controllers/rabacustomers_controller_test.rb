require 'test_helper'

class RabacustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rabacustomers_index_url
    assert_response :success
  end

  test "should get new" do
    get rabacustomers_new_url
    assert_response :success
  end

  test "should get create" do
    get rabacustomers_create_url
    assert_response :success
  end

  test "should get import" do
    get rabacustomers_import_url
    assert_response :success
  end

end
