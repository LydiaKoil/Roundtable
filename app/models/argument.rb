class Argument < ApplicationRecord
  enum reply_type: {
    pro: 0,
    con: 1
  }

  has_many :arguments, dependent: :destroy

  belongs_to :argument, optional: true
  belongs_to :user
  validates_presence_of :title

  def send_reply_notification!
  	return if self.argument_id.nil?
 
	original = Argument.find(self.argument_id)
    UserMailer.reply_email(original.user.id).deliver_later

  end

end
