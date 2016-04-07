require 'test_helper'
require 'factory_girl_rails'

class UserTest < ActiveSupport::TestCase
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_CEP_REGEX = /\d{5}\-?\d{3}/
  VALID_CPF_REGEX = /\d{3}\.?\d{3}\.?\d{3}\-?\d{2}/

  def setup
    @user = build(:user, :complete)
    @sale = build(:sale)
  end

  def teardown
    @user = nil
  end

  test "invalid without name and email" do
    user = User.new
    assert !user.valid?, "User must have at least NAME and EMAIL"
  end

  test "valid with at least name and email" do    
    assert @user.valid?, "User must have at least NAME and EMAIL"
  end

  test "invalid with only email" do    
    @user.email = nil
    assert !@user.valid?, "User must have an EMAIL"
  end

  test "should contain sale that belongs to user" do
    sale = build(:sale)
    assert @user.sales.all? {|s| @user.sale == s}
  end

  test "should have a valid email" do
    complete_user = create(:user, :complete)
    assert_match VALID_EMAIL_REGEX, complete_user.email, "This e-mail is not valid"
  end

  test "should be valid with all parameters" do
    complete_user = create(:user, :complete)
    assert_match VALID_CEP_REGEX, complete_user.cep, "This CEP is not valid"
    assert_match VALID_CPF_REGEX, complete_user.cpf, "This CPF is not valid"
    assert complete_user.valid?, "Some of the parameters is not correct: #{complete_user.errors}"
  end

  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
  should validate_uniqueness_of(:cpf)
  should have_many(:sales)
end