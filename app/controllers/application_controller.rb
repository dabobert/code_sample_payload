class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
binding.pry
1
      if resource.admin_level > 0
        "/admin"
      else
        home_path
    end
  end

end
