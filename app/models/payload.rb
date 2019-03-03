class Payload < ApplicationRecord
  mount_uploader :file, PayloadUploader

  validates_presence_of :uuid, :owner_email

  after_initialize :generate_uuid
  after_create :deliver

  scope(:completed, -> { where "payloads.uploaded_at IS NOT NULL" })

  def deliver
    PayloadMailer.with(:payload => self).notification.deliver_now
  end


  def incomplete?
    not(self.complete?)
  end
  
  def complete?
    self.uploaded_at.present?
  end

  class << self
    def seek(id, raise_error = true)
      raise(ActiveRecord::RecordNotFound, "Cannot find/seek/search without an id (or uuid)") if raise_error && id.blank?

      if id.to_s.is_i?
        self.find(id)
      else
        self.where(:uuid => id).first
      end
    end
  end

  ############################################################################
  protected
  ############################################################################

  def generate_uuid
    self.uuid ||= loop do
      random_uuid = SecureRandom.uuid.gsub("-","").slice(0,24)
      break random_uuid unless self.class.exists?(uuid: random_uuid)
    end
  end

end