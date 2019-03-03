class ExternalsController < ApplicationController
  before_action :check_signed_in

  def check_signed_in
    redirect_to after_sign_in_path_for(current_user) if signed_in?
  end

end
