module Deliverable
  class Email < ApplicationRecord
    belongs_to :entity, polymorphic: true
    has_many :email_events, foreign_key: "deliverable_email_id"

    validates_presence_of :email_name

    def open?
      open_events.any?
    end

    def opening_time
      return nil unless open_events.present?

      open_events.first.created_at - created_at
    end

    private

    def open_events
      email_events.where(event_name: "open").order(id: :asc)
    end
  end
end
