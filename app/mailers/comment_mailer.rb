# encoding: utf-8
class CommentMailer < ActionMailer::Base
  default from: "noreply@xiaoma.com"

  def comment_notify_email(recipient, subject, message) 
  	puts "----#{recipient}----#{subject} ----#{message}"
		@subject = subject  
		@recipients = recipient
		@from = 'noreply@xiaoma.com'  
		@sent_on = Time.now
		# @body["title"] = 'This is title'  
		# @body["email"] = 'noreply@xiaoma.com'  
		# @body["message"] = message
		# attachments['filename.jpg'] = File.read("/pubulic/#{}.jpg")
		# @headers = {} 
    	mail(:to => "#{recipient}", :subject => "欢迎来到我的网站")
  end
end