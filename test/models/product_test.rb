require 'test_helper'

class ProductTest < ActiveSupport::TestCase  
  should have_many :sale_items
  should validate_presence_of :title
  should validate_presence_of :sell_price
end