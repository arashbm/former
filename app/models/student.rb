class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
    :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
    :student_id, :father_name, :gender, :major, :minor, :phone_number, :mobile_phone,
    :identification_number, :birth_date, :bylaw

  has_many :filled_forms

  validates :gender, presence: true
  validates :father_name, presence: true
  validates :identification_number, presence: true
  validates :major, presence: true
  validates :mobile_phone, presence: true
  validates :phone_number, presence: true
  def full_name
    "#{first_name} #{last_name}"
  end  
  alias name full_name
end
