class ApplicationMailer < ActionMailer::Base
  default from: "\"FEPB Loja\" Loja <romero.mfm@gmail.com>", date: Time.now
  layout 'mailer'
end
