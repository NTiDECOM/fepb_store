require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "valid with all attributes" do
    b = books(:o_pequeno_principe)
    assert b.valid?, "Book is not valid"
  end
end
