module Deliverable
  module Webhooks
    class SendgridEventsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        events = JSON.parse(request.body.read)

        Deliverable::SendgridEventProcessor.new(events).process

        head 202
      end
    end
  end
end
