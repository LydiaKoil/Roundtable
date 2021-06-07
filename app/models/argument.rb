class Argument < ApplicationRecord
  #----- ENUMS -----#
  enum reply_type: { pro: 0, con: 1 }

  #----- Associations -----#
  has_many :arguments, dependent: :destroy
  belongs_to :argument, optional: true
  belongs_to :user

  #----- Validations -----#
  validates_presence_of :title
  
end
