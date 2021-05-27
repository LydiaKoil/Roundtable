class Argument < ApplicationRecord
  enum type: [:pro, :con]
  has_many :replies, class_name: "Argument",
                          foreign_key: "claim_id"

  belongs_to :claim, class_name: "Argument", optional: true
  belongs_to :user
end
