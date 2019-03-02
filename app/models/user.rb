class User < ApplicationRecord

  validates_presence_of :first_name, :last_name, :email, :admin_level

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def is_admin?
    @is_admin ||= self.admin_level > 0
  end
end
