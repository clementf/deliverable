module Deliverable
  module Webhooks
    class PostmarkEventsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        event = JSON.parse(request.body.read)

        Deliverable::PostmarkEventProcessor.new(event).process

        head 200
      end
    end
  end
end
