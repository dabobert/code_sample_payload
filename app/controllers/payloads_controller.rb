class PayloadsController < ApplicationController

  def show
    redirect_to edit_payload_path(params[:id])
  end


  def edit
    @payload = Payload.seek(params[:id])
  end
end
