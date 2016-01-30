class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.acc_created.subject
  #
  def acc_created(user)
    @user = user
    @greeting = "Hi"
    @url = 'http://localhost:3000/users/sign_up'

    attachments['book.png'] = File.read("#{Rails.root}/app/assets/images/default-book-cover.png")
    mail to: @user.email, subject: 'Bem-vindo à Livraria FEPB!'
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
      bcc: ['sign_in_notif <romero.mfm@gmail.com>'], 
      subject: 'Sign in notification'
    )
  end
end