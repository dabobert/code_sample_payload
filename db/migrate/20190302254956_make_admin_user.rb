class MakeAdminUser < ActiveRecord::Migration[5.2]
  def up
    user = User.find_or_initialize_by :first_name => "Admin", :last_name => "Robot", :email => "admin@payload.io", :admin_level => 1
    user.password = "password"
    user.password_confirmation = user.password
    user.save!
  end

  def down
    User.where(:email => "admin@payload.io").destroy_all
  end
end
