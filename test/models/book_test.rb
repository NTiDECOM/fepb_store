require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = build(:product, :book)
  end

  test "valid with all attributes" do    
    assert @book.valid?, "Book is not valid - #{@book.errors}"
  end
end
