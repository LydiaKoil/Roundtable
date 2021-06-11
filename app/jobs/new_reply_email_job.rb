class NewReplyEmailJob < ApplicationJob
  queue_as :default

  def perform(id)
    # Do something later
  	mail = UsersMailer.welcome_email(id)
	#mail.deliver_now
	mail.deliver_later
  end
end
