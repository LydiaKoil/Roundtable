class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :set_full_name
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :arguments
  validates :first_name, presence: true
  validates :last_name, presence: true

  def set_full_name
	   self.full_name = "#{self.first_name} #{self.last_name}"
   end
end
