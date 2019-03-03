class Admin::UsersController < AdminController


  def index
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
  end

  def create
  end

end
