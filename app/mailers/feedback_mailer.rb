class FeedbackMailer < ApplicationMailer

  def message_email(user, message)
    #@from = user.email
    @message = message
    Admin.all.each { |admin| mail(to: admin.email , subject: "Message from #{@from}") }
  end
end
