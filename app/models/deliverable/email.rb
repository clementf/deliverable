module Deliverable
  class Email < ApplicationRecord
    belongs_to :entity, polymorphic: true
    has_many :email_events, foreign_key: "deliverable_email_id"

    validates_presence_of :email_name
  end
end
