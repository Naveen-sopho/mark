class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :marks
  has_many :teachers, through: :marks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true ,uniqueness: true
  validates :email, presence:true ,uniqueness: true

end
