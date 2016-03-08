require 'test_helper'

class SaleItemsControllerTest < ActionController::TestCase

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
    @sale_item = create(:sale_item)
  end

  test "should create" do        
    post :create, sale_item: @sale_item.attributes
    assert_response :success
  end

  test "should update" do    
    session[:sale_id] = @sale_item.sale_id
    put :update, 
      id: @sale_item, 
      sale_id: @sale_item.sale_id,
      sale_item: @sale_item.attributes
    assert_response :success
  end
end