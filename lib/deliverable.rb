require "deliverable/version"
require "deliverable/engine"
require "deliverable/outgoing_email_observer"
require "deliverable/sendgrid_event_processor"
require "deliverable/postmark_event_processor"

module Deliverable
  ActiveSupport.on_load(:action_mailer) do
    ActionMailer::Base.register_observer(OutgoingEmailObserver)
  end
end
