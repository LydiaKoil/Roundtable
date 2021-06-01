class Argument < ApplicationRecord
  enum reply_type: {
    pro: 0,
    con: 1
  }

  has_many :arguments, dependent: :destroy

  belongs_to :argument, optional: true
  belongs_to :user
  validates_presence_of :title

end
