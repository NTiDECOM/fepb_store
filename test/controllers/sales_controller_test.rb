require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  def setup    
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
  end

  test "should get show" do
    sign_in @user
    get :show, id: @user.id
    assert_response :success
  end
end