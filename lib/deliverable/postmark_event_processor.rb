module Deliverable
  class PostmarkEventProcessor
    def initialize(event)
      @event = event
    end

    def process
      deliverable_id = event["Metadata"]["deliverable_id"]
      email = Email.find_by(id: deliverable_id)

      unless email.present?
        Rails.logger.warn("Couldn't find Deliverable::Email with id #{deliverable_id}")
        return
      end

      event_type = event["RecordType"]

      if event_type == "Bounce"
        email.update(failure_reason: event["Description"])
      end

      EmailEvent.create!(
        email: email,
        event_name: sendgrid_event_type,
        link_clicked: event["OriginalLink"]
      )
    end
  end
end
