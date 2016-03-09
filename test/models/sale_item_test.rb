require 'test_helper'

class SaleItemTest < ActiveSupport::TestCase
  should belong_to :sale
  should belong_to :product

  def setup
    @sale_item = build(:sale_item)
  end

  test "total_price should be equalto unit_price * product_quantity" do
    assert_equal @sale_item.total_price, (@sale_item.unit_price * @sale_item.product_quantity)
  end
end