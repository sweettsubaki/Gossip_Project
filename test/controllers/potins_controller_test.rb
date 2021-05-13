require 'test_helper'

class PotinsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get potins_show_url
    assert_response :success
  end

end
