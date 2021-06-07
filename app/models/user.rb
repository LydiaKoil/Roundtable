class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :set_full_name
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :arguments
  validates :first_name, :last_name, presence: true

  def full_name
	  "#{self.first_name} #{self.last_name}"
  end
end