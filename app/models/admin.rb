class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :registrable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
    :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :password_confirmation
end
