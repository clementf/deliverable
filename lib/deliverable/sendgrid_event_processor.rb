module Deliverable
  class SendgridEventProcessor
    def initialize(events)
      @events = events
    end

    def process
      @events.each do |event|
        email = Email.find(event["deliverable_id"])

        unless email.present?
          Rails.logger.warn("Couldn't find Deliverable::Email with id #{event["deliverable_id"]}")
          next
        end

        sendgrid_event_type = event["event"]

        if event["reason"]
          email.update(failure_reason: event["reason"])
        end

        EmailEvent.create!(
          email: email,
          event_name: sendgrid_event_type,
          link_clicked: event["url"]
        )
      end
    end
  end
end
