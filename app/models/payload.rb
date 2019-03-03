class Payload < ApplicationRecord
  validates_presence_of :uuid, :owner_email
end
