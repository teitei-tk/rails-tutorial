require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get post" do
    get :post
    assert_response :success
  end

end
