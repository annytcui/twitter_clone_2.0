require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anny)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should redirect new when logged in" do
    log_in_as(@user)
    get login_path
    assert_redirected_to root_path
  end
end
