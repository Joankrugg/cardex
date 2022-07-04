require 'test_helper'

class MillesimeCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get millesime_customers_index_url
    assert_response :success
  end

end
