class PayloadsController < ApplicationController
  before_action :seek_payload

  def show
    redirect_to edit_payload_path(params[:id]) and return if @payload.incomplete?
  end


  def edit
  end

  def update
    begin
      @payload.update_attributes! payload_params
      flash[:success] = "payload Created"
      redirect_to payload_path(@payload.uuid)
    rescue Exception => error
      flash[:error] = error.message
      render :action => :edit
    end
  end





  ############################################################################
  private
  ############################################################################


  def seek_payload
    @payload = Payload.find_by_uuid!(params[:id])
  end

  def payload_params
    params.require(:payload).permit(:file, :descr, :uploaded_at)
  end


end
