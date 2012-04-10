class Mailer < ActionMailer::Base
  def feedback(message)
    @message = message
    mail :to => "admin@eAppsCasts.com", :from => @message.email, :subject => "eAppsCasts Feedback from #{@message.name}"
  end

  def comment_response(comment, user)
    @comment = comment
    @user = user
    mail :to => @user.email, :from => "noreply@eAppsCasts.com", :subject => "Comment Response on eAppsCasts"
  end
end
