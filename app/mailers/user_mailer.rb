class UserMailer < ApplicationMailer
	def reply_email(user_id)
	    @user = User.find(user_id)

	    mail(   :to      => @user.email,
	            :subject => "You've gotten a response!"
	    ) do |format|
	      format.text
	      format.html
	    end
	end
end
