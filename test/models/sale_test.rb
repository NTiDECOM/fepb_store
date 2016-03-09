require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  should belong_to :user
  should have_many :sale_items

  test "should have status in_progress after creation" do
    sale = create(:sale)
    assert_equal "in_progress", sale.status
  end
end