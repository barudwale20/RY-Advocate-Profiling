require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get view1" do
    get show_view1_url
    assert_response :success
  end

end
