class ApplicationMailer < ActionMailer::Base
  default from: "romero.mfm@gmail.com", date: Time.now
  layout 'mailer'
end
