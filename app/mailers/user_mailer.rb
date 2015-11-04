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

    attachments['book.png'] = File.read("#{Rails.root}/app/assets/images/default-book-cover.png")
    mail to: @user.email, subject: 'Bem-vindo à Livraria FEPB!'
  end
end
