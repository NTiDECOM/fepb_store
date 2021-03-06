require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "acc_created" do
    user = build(:user)

    mail = UserMailer.acc_created(user)
    assert_equal "Bem-vindo à FEPB Loja!", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["romero.mfm@gmail.com"], mail.from    
  end
end