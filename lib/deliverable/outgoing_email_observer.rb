module Deliverable
  class OutgoingEmailObserver
    def self.delivered_email(email)
      return unless email['deliverable_id'].present?

      queued_email_id = email['deliverable_id'].value.to_i

      Email.find(queued_email_id).update(
        provider_message_id: email.message_id
      )
    end
  end
end
