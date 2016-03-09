require 'test_helper'

class SaleItemTest < ActiveSupport::TestCase
  should belong_to :sale
end
