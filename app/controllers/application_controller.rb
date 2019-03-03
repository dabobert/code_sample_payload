class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.admin_level > 0
      "/admin"
    else
      home_path
    end
  end

end
