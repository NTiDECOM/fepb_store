class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.acc_created.subject
  #
  def acc_created(user)
    @user = user
    @greeting = "Olá, #{@user.name}, seja bem-vindo!"
    @message = "Sua conta na FEPB Loja acabou de ser criada. Para qualquer dúvida de utilização do sistema entre em contato com Shirley Para qualquer dúvida técnica contate o administrador Romero Meireles (996-447-337). Para acessar o site siga o link: #{root_url}"
    
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(
      to: @user.email, 
      bcc: ['acc_created <romeromeireles@hotmail.com>'], 
      subject: 'Bem-vindo à FEPB Loja!'
    )
  end

  def sign_in_notif(user)
    @user = user
    @greeting = "Olá, seja bem-vindo!"
    @body = "#{@user.name} acabou de se autenticar na FEPB Store."
    @url = 'http://localhost:3000/users/sign_in'

    headers('X-Author' => 'Romero Meireles')
    attachments['photo'] = File.read("#{Rails.root}/app/assets/images/fepb.png")
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(
      to: @user.email, 
      bcc: ['sign_in_notif <romeromeireles@hotmail.com>'], 
      subject: 'FEPB Sign in notification'
    )
  end
end