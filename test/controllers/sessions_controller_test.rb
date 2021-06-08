equire 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    conor = users(:one)
    post login_url, params: { name: conor.name, password: 'secret' }
    assert_redirected_to admin_url
    assert_equal conor.id, session[:user_id]
  end

  test "should fail login" do
    conor = users(:one)
    post login_url, params: { name: conor.name, password: 'wrong' }
    assert_redirected_to login_url
  end

  test "should logout" do
    delete logout_url
    assert_redirected_to store_url
  end
end
