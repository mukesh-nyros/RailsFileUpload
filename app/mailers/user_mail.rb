class UserMail < ActionMailer::Base
  default from: "mukesh.nyros@gmail.com"
  def send_attach(user,subject,attached)
    @user = user
    @subject = subject
    @attached = attached
    ref = @attached.split("/")
    attachments[ref[ref.length-1]] = File.read("#{Rails.root}/public/"+@attached)
    mail :to => @user, :subject => @subject
  end
 
end
