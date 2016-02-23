class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.acc_created.subject
  #
  def acc_created(user)
    @user = user
    @greeting = "Hi"
    @url = new_user_session_url

    attachments['photo'] = File.read("#{Rails.root}/app/assets/images/fepb.png")
    headers('X-Author' => 'Romero Meireles')
    mail(
      to: @user.email, 
      subject: 'Bem-vindo à FEPB Loja!',
      bcc: ['acc_created <romero.mfm@gmail.com>']
    )
  end

  def sign_in_notif(user)
    @user = user
    @greeting = "Olá, seja bem-vindo!"
    @body = "#{@user.name} acabou de se autenticar na FEPB Store."
    @url = 'http://localhost:3000/users/sign_in'

    headers('X-Author' => 'Romero Meireles')
    attachments['photo'] = File.read("#{Rails.root}/app/assets/images/fepb.png")
    mail(
      to: @user.email, 
      subject: 'Sign in notification',
      bcc: ['sign_in_notif <romero.mfm@gmail.com>'], 
    )
  end
end