class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USERNAME']||'from@example.com'
  layout 'mailer'
end
