class Admin::UsersController < ApplicationController


  def index
    @users = Users.paginate
  end

  def new
    @user = User.new
  end

  def create
  end

end
