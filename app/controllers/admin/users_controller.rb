class Admin::UsersController < AdminController


  def index
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
    render :action => :action
  end


  def create
    @user  = User.new user_params
    begin
      @user.save!
      flash[:success] = "New User Created"
      redirect_to admin_users_path
    rescue Exception => error
      flash[:error] = error.message
      render :action => :action
    end
  end


  def show
    @user = User.find(params[:id])
    redirect_to edit_admin_user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
    render :action => :action
  end


  def update
    @user = User.find(params[:id])
    begin
      @user.update_attributes! user_params
      flash[:success] = "User Created"
      redirect_to admin_users_path
    rescue Exception => error
      flash[:error] = error.message
      render :action => :action
    end
  end

  ############################################################################
  private
  ############################################################################

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin_level, :password, :password_confirmation)
  end



end
