class Admin::PayloadsController < AdminController

  def index
    @payloads = Payload.paginate(:page => params[:page])
  end

  def new
    @payload = Payload.new
    render :action => :action
  end

  def create
    @payload  = Payload.new payload_params
    begin
      @payload.save!
      flash[:success] = "New Payload Created"
      redirect_to admin_payloads_path
    rescue Exception => error
      flash[:error] = error.message
      render :action => :action
    end
  end


  def completed
    @payloads = Payload.completed.paginate(:page => params[:page])
    render :action => :index
  end


  ############################################################################
  private
  ############################################################################

  def payload_params
    params.require(:payload).permit(:owner_email, :user_id)
  end

end
