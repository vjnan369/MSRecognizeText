require 'test_helper'

class HandWritingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hand_writings_index_url
    assert_response :success
  end

end
