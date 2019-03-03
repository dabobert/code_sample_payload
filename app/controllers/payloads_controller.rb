class PayloadsController < ApplicationController

  def show
    @payload = Payload.seek(params[:id])
    redirect_to edit_payload_path(@payload)
  end


  def edit
    @payload = Payload.seek(params[:id])
  end
end
