require 'test_helper'

class UserTest < ActiveSupport::TestCase
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def setup
    @user = users(:admin)
    @sale = sales(:one)
  end

  test "invalid without name and email" do
    u = User.new
    assert !u.valid?, "User must have at least NAME and EMAIL"
  end

  test "valid with at least name and email" do
    assert @user.valid?, "User must have at least NAME and EMAIL"
  end

  test "invalid with only email" do    
    @user.email = nil
    assert !@user.valid?, "User must have an EMAIL"
  end

  test "should contain sale that belongs to user" do
    assert @user.sales.all? {|s| @user.sale == s}
  end

  test "should have a valid email" do
    assert_match VALID_EMAIL_REGEX, "romero.mfm@gmail.com", "This e-mail is not valid"
  end

  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should have_many(:sales)
  should validate_uniqueness_of(:email)
end