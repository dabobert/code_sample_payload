class User < ApplicationRecord

  validates_presence_of :first_name, :last_name, :email, :admin_level

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable


  def name
    "#{self.first_name} #{self.last_name}".strip
  end

  def is_admin?
    @is_admin ||= self.admin_level > 0
  end

  def access_level
    if self.is_admin?
      "Admin"
    else
      "Regular"
    end
  end
end
