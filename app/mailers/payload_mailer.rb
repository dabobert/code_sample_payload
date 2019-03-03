class PayloadMailer < ApplicationMailer

  def notification
    @payload = params[:payload]
    mail(to: @payload.owner_email, subject: "[Payload.io] You have been sent a payload")
  end


end
