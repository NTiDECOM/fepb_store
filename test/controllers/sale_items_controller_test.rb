require 'test_helper'

class SaleItemsControllerTest < ActionController::TestCase

  def setup
    @sale_item = sale_items(:one)
  end

  test "should create" do
    post :create, sale_item: @sale_item.attributes
    assert_response :success
  end

  # test "should update" do
  #   sale_item = sale_items(:one)
  #   put :update, {id: sale_item.id, sale_id: sale_item.sale_id}
  #   assert_response :success
  # end

  test "should destroy" do
    sale_item = sale_items(:one)
    delete :destroy, id: sale_item.id

    assert_redirected_to new_user_session_path
  end
end
