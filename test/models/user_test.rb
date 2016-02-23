require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid_without_name_and_email" do
    u = User.new
    assert !u.valid?, "User must have at least NAME and EMAIL"
  end
end
