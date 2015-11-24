require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "valid with all attributes" do
    b = Book.new(:book1)
    assert p.valid?, "Book is not valid"
  end
end
