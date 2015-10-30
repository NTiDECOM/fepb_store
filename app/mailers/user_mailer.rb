class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.acc_created.subject
  #
  def acc_created(user)
    @user = user
    @greeting = "Hi"
    @url = 'http://localhost:3000/users/sign_in'

    attachments['decom.png'] = File.read("#{Rails.root}/app/assets/images/decom.png")
    mail to: @user.email, subject: 'Bem-vindo à Livraria FEPB!'
  end
end
